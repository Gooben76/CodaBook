//
//  Refs.swift
//  CodaBook
//
//  Created by Benoît Goossens on 18/06/18.
//  Copyright © 2018 Benoît Goossens. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage

class Refs {
    
    static let obtenir = Refs()
    
    let baseBDD = Database.database().reference()
    let baseStorage = Storage.storage().reference()
    
    var baseUtilisateurs: DatabaseReference {
        return baseBDD.child(UTILISATEUR)
    }
    
    var basePhotosDeProfil : StorageReference {
        return baseStorage.child(UTILISATEUR)
    }
    
}
