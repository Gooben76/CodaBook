//
//  ProfilController.swift
//  CodaBook
//
//  Created by Benoît Goossens on 23/06/18.
//  Copyright © 2018 Benoît Goossens. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ProfilController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageDeProfil: ImageRonde!
    @IBOutlet weak var prenomLabel: UILabel!
    @IBOutlet weak var nomLabel: UILabel!
    
    var profil: Utilisateur?
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        obtenirProfil()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imageDeProfil.isUserInteractionEnabled = true
        imageDeProfil.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(prendrePhoto)))
    }
    
    @objc func prendrePhoto() {
        Alerte.montrer.photo(imagePicker: imagePicker, controller: self)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var image: UIImage?
        if let editee = info[UIImagePickerControllerEditedImage] as? UIImage {
            image = editee
        }
        if let originale = info[UIImagePickerControllerOriginalImage] as? UIImage {
            image = originale
        }
        picker.dismiss(animated: true, completion: nil)
        guard image != nil, let data = UIImageJPEGRepresentation(image!, 0.2) else {return}
        guard let id = Auth.auth().currentUser?.uid else {return}
        let ref = Refs.obtenir.basePhotosDeProfil.child(id)
        ref.putData(data, metadata: nil) { (metadata, error) in
            ref.downloadURL(completion: { (url, error) in
                if let urlString = url?.absoluteString {
                    let userRef = Refs.obtenir.baseUtilisateurs.child(id)
                    userRef.updateChildValues([IMAGE_URL: urlString])
                }
            })
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func obtenirProfil() {
        guard let id = Auth.auth().currentUser?.uid else {return}
        let ref = Refs.obtenir.baseUtilisateurs.child(id)
        ref.observe(.value) { (snapshot) in
            if let dict = snapshot.value as? [String : String], let prenom = dict[PRENOM], let nom = dict[NOM] {
                let nouvelUtilisateur = Utilisateur(prenom: prenom, nom: nom, imageUrl: IMAGE_URL)
                self.profil = nouvelUtilisateur
                self.miseAJourDonnee()
            }
        }
    }
    
    func miseAJourDonnee() {
        guard profil != nil else {return}
        prenomLabel.text = PRENOM + " :  " + self.profil!.prenom
        nomLabel.text = NOM + " :  " + self.profil!.nom
        imageDeProfil.telecharger(self.profil!.imageUrl)
    }
    
    @IBAction func deconnexionAction(_ sender: Any) {
        Alerte.montrer.deconnexion(self)
    }
    
    @IBAction func editProfilAction(_ sender: Any) {
        if let bouton = sender as? UIButton {
            var array = [String]()
            switch (bouton.tag) {
                case 0 : array.append(PRENOM)
                case 1 : array.append(NOM)
                default: break
            }
            guard array.count == 1 else {return}
            Alerte.montrer.alerteTF(titre: MODIFIER, message: array[0], array: array, controller: self, completion: nil)
        }
    }
    
}
