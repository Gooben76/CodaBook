//
//  ConnectionController.swift
//  CodaBook
//
//  Created by Benoît Goossens on 15/06/18.
//  Copyright © 2018 Benoît Goossens. All rights reserved.
//

import UIKit
import FirebaseAuth

class ConnectionController: UIViewController {

    @IBOutlet weak var titreLabel: UILabel!
    @IBOutlet weak var mailTF: UITextField!
    @IBOutlet weak var mdpTF: UITextField!
    @IBOutlet weak var connectionBouton: BoutonCodaBook!
    @IBOutlet weak var pasDeCompteLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(cacherClavier)))
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cacher(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let id = Auth.auth().currentUser?.uid {
            verifierUtilisateur(id: id)
        } else {
            cacher(false)
        }
    }
    
    func cacher(_ bool: Bool) {
        titreLabel.isHidden = bool
        mailTF.isHidden = bool
        mdpTF.isHidden = bool
        connectionBouton.isHidden = bool
        pasDeCompteLabel.isHidden = bool
    }
    
    @objc func cacherClavier() {
        view.endEditing(true)
    }
    
    func verifierUtilisateur(id: String) {
        print("Vérif utilisateur")
        let referenceFirebase = Refs.obtenir.baseUtilisateurs.child(id)
        referenceFirebase.observe(.value) { (snapshot) in
            if snapshot.exists() {
                //passer à l'app
            } else {
                self.finalisation()
            }
        }
    }
    
    func finalisation() {
        Alerte.montrer.alerteTF(titre: FINALISER, message: DERNIER_PAS, array: [PRENOM, NOM], controller: self, completion: { (success) -> (Void) in
            if let bool = success, bool == true {
                // Passer à l'app
            } else {
                self.finalisation()
            }
        })
    }
    
    func completion(_ authDataResult: AuthDataResult?, _ error: Error?) {
        if let erreur = error {
            let nsErreur = erreur as NSError
            if nsErreur.code == 17011 {
                //Création de l'utilisateur
                print("Erreur 17011")
                Auth.auth().createUser(withEmail: mailTF.text!, password: mdpTF.text!, completion: completion(_:_:))
            } else {
                Alerte.montrer.erreur(message: nsErreur.convertirErreurFirebaseEnString(), controller: self)
            }
        }
        if let utilisateur = authDataResult {
            verifierUtilisateur(id: utilisateur.user.uid)
        }
    }
    
    @IBAction func connecterAction(_ sender: Any) {
        print("click")
        view.endEditing(true)
        if let adresse = mailTF.text, adresse != "" {
            if let mdp = mdpTF.text, mdp != "" {
                print("test user")
                Auth.auth().signIn(withEmail: adresse, password: mdp, completion: completion(_:_:))
            } else {
                Alerte.montrer.erreur(message: MDP_VIDE, controller: self)
            }
        } else {
            Alerte.montrer.erreur(message: ADRESSE_VIDE, controller: self)
        }
    }
}
