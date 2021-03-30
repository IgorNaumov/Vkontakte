//
//  Friends.swift
//  Vkontakte
//
//  Created by Игорь Наумов on 17.02.2021.
//
import Foundation
import Alamofire

struct GetFriends: Decodable {
    let response: Response
}

struct Response: Decodable {
    let items: [MyFriend]
}
struct MyFriend: Decodable {
    let firstName: String
    let lastName: String
    let id: Int
    
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case id
    }
    
}


    
    
func loadFriendsFromVK (completion: @escaping ([MyFriend]) -> ())  {
        AF.request("https://api.vk.com/method/friends.get", method: .get, parameters: [
            "access_token" : SessionVK.instance.token,
            "user_id" : SessionVK.instance.userId,
            //"order" : "name",
            "lang" : "ru",
            "fields" : "first_name, last_name, user_id",
            "v" : "5.130"
        ]).responseJSON {
            response in
            guard let data = response.value else { return }
            do {
                let users = try! JSONDecoder().decode(GetFriends.self, from: data as! Data).response.items
                print(users)
                completion(users)
            } catch {
                print(error)
            }
               
           
        }
    }



