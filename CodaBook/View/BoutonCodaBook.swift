//
//  BoutonCodaBook.swift
//  CodaBook
//
//  Created by Benoît Goossens on 15/06/18.
//  Copyright © 2018 Benoît Goossens. All rights reserved.
//

import UIKit

class BoutonCodaBook: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        miseEnPlace()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        miseEnPlace()
    }
    
    func miseEnPlace() {
        backgroundColor = UIColor.white
        tintColor = BLEU_CODABOOK
        layer.miseEnPlace(10)
    }

}
