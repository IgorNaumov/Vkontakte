//
//  Friends.swift
//  Vkontakte
//
//  Created by Игорь Наумов on 17.02.2021.
//

import UIKit


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


    

