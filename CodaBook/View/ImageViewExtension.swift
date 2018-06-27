//
//  ImageViewExtension.swift
//  CodaBook
//
//  Created by Benoît Goossens on 24/06/18.
//  Copyright © 2018 Benoît Goossens. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView {
    
    func telecharger(_ urlString: String?) {
        image = #imageLiteral(resourceName: "Superman-facebook.svg")
        guard urlString != nil, let url = URL(string: urlString!) else {return}
        sd_setImage(with: url, completed: nil)
    }
}
