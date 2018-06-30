//
//  ViewCadaBook.swift
//  CodaBook
//
//  Created by Benoît Goossens on 30/06/18.
//  Copyright © 2018 Benoît Goossens. All rights reserved.
//

import UIKit

class ViewCadaBook: UIView {

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
        layer.miseEnPlace(10)
    }
}
