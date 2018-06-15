//
//  LayerExtension.swift
//  CodaBook
//
//  Created by Benoît Goossens on 15/06/18.
//  Copyright © 2018 Benoît Goossens. All rights reserved.
//

import UIKit

extension CALayer {
    
    func miseEnPlace(_ radius: CGFloat) {
        cornerRadius = radius
        shadowColor = UIColor.darkGray.cgColor
        shadowOpacity = 0.5
        shadowOffset = CGSize(width: 3, height: 3)
        shadowRadius = 3
    }
}
