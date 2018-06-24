//
//  ProfilController.swift
//  CodaBook
//
//  Created by Benoît Goossens on 23/06/18.
//  Copyright © 2018 Benoît Goossens. All rights reserved.
//

import UIKit

class ProfilController: UIViewController {

    @IBOutlet weak var imageDeProfil: UIImageView!
    @IBOutlet weak var prenomLabel: UILabel!
    @IBOutlet weak var nomLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func deconnexionAction(_ sender: Any) {
        Alerte.montrer.deconnexion(self)
    }
    
    @IBAction func editProfilAction(_ sender: Any) {
    }
    
}
