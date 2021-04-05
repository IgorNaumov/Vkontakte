//
//  Group.swift
//  Vkontakte
//
//  Created by Игорь Наумов on 17.02.2021.
//

import UIKit
import Foundation
import Alamofire


//MARK: - GroupVK
struct GroupsVK: Codable {
    let response: GroupObject
}

struct GroupObject: Codable {
    let count: Int
    let items: [Group]
}

struct Group: Codable {
    
    let name: String
    let photo_50: String
}


