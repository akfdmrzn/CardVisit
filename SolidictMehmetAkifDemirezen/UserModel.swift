//
//  UserModel.swift
//  KonusarakOgren
//
//  Created by KO on 27.07.2017.
//  Copyright © 2017 KonusarakOgren. All rights reserved.
//

import Foundation
import CoreData

class UserModel: NSObject {
    
    private var _cards : [CardVisitModel] = []
 
    
    
    var cards : [CardVisitModel] {
        get {
            if let cards = UserDefaults.standard.value(forKey: "cards") as? [CardVisitModel] {
                return cards
            }
            else {
                return []
            }
        }
        set {
            self._cards = newValue
            UserDefaults.standard.set(self._cards, forKey: "cards")
        }
    }
}













