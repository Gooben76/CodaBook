//
//  PostController.swift
//  CodaBook
//
//  Created by Benoît Goossens on 30/06/18.
//  Copyright © 2018 Benoît Goossens. All rights reserved.
//

import UIKit
import FirebaseAuth

class PostController: UIViewController, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var photoDuPost: UIImageView!
    @IBOutlet weak var textDuPost: UITextView!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textDuPost.text = TEXTE_VIDE
        textDuPost.delegate = self
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(rangerClavier)))
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
    }

    @objc func rangerClavier() {
        view.endEditing(true)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textDuPost.text == TEXTE_VIDE {
            textDuPost.text = ""
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let editee = info[UIImagePickerControllerEditedImage] as? UIImage {
            photoDuPost.image = editee
        } else if let original = info[UIImagePickerControllerOriginalImage] as? UIImage {
            photoDuPost.image = original
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func photoAction(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func libraryAction(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func envoyerACtion(_ sender: Any) {
        view.endEditing(true)
        guard let userId = Auth.auth().currentUser?.uid else {return}
        if textDuPost.text == TEXTE_VIDE || textDuPost.text == "" {
            Alerte.montrer.erreur(message: VIDE, controller: self)
        } else {
            var dict: [String: AnyObject] = [
                TEXTE: textDuPost.text as AnyObject,
                DATE_POST: Date().timeIntervalSince1970 as AnyObject,
                USER_ID: userId as AnyObject
            ]
            if photoDuPost.image != nil {
                
            } else {
                
            }
        }
    }
}
