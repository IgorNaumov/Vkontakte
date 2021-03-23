//
//  Group.swift
//  Vkontakte
//
//  Created by Игорь Наумов on 17.02.2021.
//

import UIKit

class Group {
    var name: String
    var avatar: UIImage?
    var countOfPeople: Int = 100
    
    
    init (name: String, avatar: String) {
        self.name = name
        self.avatar = UIImage(named: avatar)
    }
    
    
    
}
extension Group: Equatable {
    static func == (lhs: Group, rhs: Group) -> Bool {
        lhs.name == rhs.name && lhs.avatar == rhs.avatar
    }
}
