//
//  PhotoVK.swift
//  Vkontakte
//
//  Created by Игорь Наумов on 25.03.2021.
//

import Foundation
import Alamofire


func loadPhotoFromVK () {
    AF.request("https://api.vk.com/method/photos.getAll", parameters: [
        "access_token" : SessionVK.instance.token,
        "userId" : SessionVK.instance.userId,
        "lang" : "ru",
        
        "extended": "1",
        "v" : "5.130"
    ]).responseJSON {
        response in
        print(response.value as Any)
    }
    
    
}
