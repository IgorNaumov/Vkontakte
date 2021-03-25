//
//  Group.swift
//  Vkontakte
//
//  Created by Игорь Наумов on 17.02.2021.
//

import UIKit
import Alamofire

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

func loadgroupFromVK () {
    AF.request("https://api.vk.com/method/groups.get", parameters: [
        "access_token" : SessionVK.instance.token,
        "userId" : SessionVK.instance.userId,
        "lang" : "ru",
        "fields" : "name, photo_50, screen_name",
        "extended": "1",
        "v" : "5.130"
    ]).responseJSON {
        response in
        print(response.value as Any)
    }
    
    
}
