//
//  Friends.swift
//  Vkontakte
//
//  Created by Игорь Наумов on 17.02.2021.
//
import Foundation
import Alamofire

struct UserResponse: Decodable {
    let response: Response?
}
    struct  Response: Decodable {
        let items: [MyFriends]
    }
    struct MyFriends: Decodable {
        var id = 0
        var firstName = ""
        var lastName = ""
        var avatar = ""
        
        enum ItemsKeys: String, CodingKey {
            case id = "id"
            case firstName = "first_name"
            case lastName = "last_name"
            case avatar = "photo_50"
        }
        
//        init(from decoder: Decoder) throws {
//            
//            let values = try decoder.container(keyedBy: ItemsKeys.self)
//            self.id = try values.decode(Int.self, forKey: .id)
//            self.firstName = try values.decode(String.self, forKey: .firstName)
//            self.lastName = try values.decode(String.self, forKey: .lastName)
//            self.avatar = try values.decode(String.self, forKey: .avatar)
//        }
    }
    


class LoadFriends {
    
    
   static func loadFriendsFromVK(completion: @escaping ([MyFriends]) -> Void)  {
        AF.request("https://api.vk.com/method/friends.get", parameters: [
            "access_token" : SessionVK.instance.token,
            "userId" : SessionVK.instance.userId,
            "order" : "name",
            "lang" : "ru",
            "fields" : "first_name, last_name, bdate, photo_50, id",
            "v" : "5.130"
        ]).responseData {
            response in
            guard let data = response.value else { return}
            do {
                let friend = try JSONDecoder().decode(UserResponse.self, from: data).response?.items
                completion(friend!)
                print(friend!)
            } catch {
                print(error)
            }
        }
    }
}

