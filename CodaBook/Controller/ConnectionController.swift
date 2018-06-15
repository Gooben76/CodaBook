//
//  ConnectionController.swift
//  CodaBook
//
//  Created by Benoît Goossens on 15/06/18.
//  Copyright © 2018 Benoît Goossens. All rights reserved.
//

import UIKit

class ConnectionController: UIViewController {

    @IBOutlet weak var titreLabel: UILabel!
    @IBOutlet weak var mailTF: UITextField!
    @IBOutlet weak var mdpTF: UITextField!
    @IBOutlet weak var connectionBouton: BoutonCodaBook!
    @IBOutlet weak var pasDeCompteLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func seConnecterAction(_ sender: Any) {
        
    }
}
