//
//  Friends.swift
//  Vkontakte
//
//  Created by Игорь Наумов on 17.02.2021.
//

import UIKit
import Alamofire


func loadFriendsFromVK () {
    AF.request("https://api.vk.com/method/friends.get", parameters: [
        "access_token" : SessionVK.instance.token,
        "userId" : SessionVK.instance.userId,
        "order" : "name",
        "lang" : "ru",
        "fields" : "first_name, last_name, bdate, photo_50, id",
        "v" : "5.130"
    ]).responseJSON {
        response in
        print(response.value as Any)
    }
    
    
}



struct Friend {
    var name: String
    var surname: String
    var avatar: UIImage?
    var photos: [UIImage] = []
    
    init(name: String, surname: String, avatar: String) {
        self.name = name
        self.surname = surname
        let img = UIImage(named: avatar)
        self.avatar = img
        if let unwrappedImage = img {
            self.photos = Array(repeating: unwrappedImage, count: 10)
        }
      
        }
    }


    

