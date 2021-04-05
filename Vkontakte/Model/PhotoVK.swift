//
//  PhotoVK.swift
//  Vkontakte
//
//  Created by Игорь Наумов on 25.03.2021.
//

import Foundation


struct PhotoResponse: Decodable {
    let response: PhotoObject
}

struct PhotoObject: Decodable {
    let items: [Photo]
}

struct Photo: Decodable {
    var type = ""
    var photoUrl = ""

    
    enum CodingKeys: String, CodingKey {
        case sizes = "sizes"
        case likes = "likes"
    }
    
    enum SizeKeys: String, CodingKey {
        case type = "type"
        case photoUrl = "url"
    }
    

    
    init(from decoder: Decoder) throws {
        let photoValues = try decoder.container(keyedBy: CodingKeys.self)
        
        var sizesArray = try photoValues.nestedUnkeyedContainer(forKey: .sizes)
        let sizesValues = try sizesArray.nestedContainer(keyedBy: SizeKeys.self)
        self.type = try sizesValues.decode(String.self, forKey: .type)
        self.photoUrl = try sizesValues.decode(String.self, forKey: .photoUrl)

    }
}



