//
//  TabBar.swift
//  CodaBook
//
//  Created by Benoît Goossens on 23/06/18.
//  Copyright © 2018 Benoît Goossens. All rights reserved.
//

import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .black
        tabBar.isTranslucent = false
        tabBar.barTintColor = BLEU_CODABOOK
    }

}
