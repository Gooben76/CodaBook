//
//  Alerte.swift
//  CodaBook
//
//  Created by Benoît Goossens on 16/06/18.
//  Copyright © 2018 Benoît Goossens. All rights reserved.
//

import UIKit

class Alerte {
    
    static let montrer = Alerte()
    
    func erreur(message: String, controller : UIViewController) {
        let alerte = UIAlertController(title: ERREUR, message: message, preferredStyle: .alert)
        alerte.addAction(UIAlertAction(title: OK, style: .default, handler: nil))
        controller.present(alerte, animated: true, completion: nil)
    }
}
