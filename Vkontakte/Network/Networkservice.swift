//
//  Networkservice.swift
//  Vkontakte
//
//  Created by Игорь Наумов on 30.03.2021.
//
import UIKit
import Foundation
import Alamofire



 //MARK: - get Frieds
    
class NetWorkService {
    
    func loadFriendsFromVK (complition: @escaping ([Friends]) -> Void){
        
        let baseUrl = "https://api.vk.com"
        let path = "/method/friends.get"
        
        let parametrs: Parameters = [
            "access_token" : Session.instance.accessToken,
            "user_id" : Session.instance.userID,
            "lang" : "ru",
            "fields" : "name, photo_50",
            "v" : "5.130"
        ]
        
        let url = baseUrl+path
        
        
        AF.request(url, method: .get, parameters: parametrs).responseData { response in
            
            do {
                let getfriends = try JSONDecoder().decode(FriendVK.self, from: response.value!)
                complition(getfriends.response.items)
                print(getfriends)
            } catch {
                print(error.localizedDescription)
            }
            
            
            
        }
        
        
    }

    //MARK:-get Groups
    
    func loadGroupsFromVK(completion: @escaping ([Group]) -> Void) {

        let baseURL = "https://api.vk.com"
        let path = "/method/groups.get"

        let parametrs: Parameters = [
            "access_token": Session.instance.accessToken,
            "user_id": Session.instance.userID,
            "extended": 1,
            "v": "5.130"
        ]
        let url = baseURL+path
        AF.request(url, method: .get, parameters: parametrs).responseData { response in
            guard let data = response.value else {return}
            do {
                let getgroups = try JSONDecoder().decode(GroupsVK.self, from: data).response
                completion(getgroups.items)
            } catch {
                print(error.localizedDescription)
            }
        }


    }
    
    func loadPhotoFriend(onwerId: Int, complition: @escaping ([Photo]) -> Void) {
        
        let baseurl = "https://api.vk.com"
        let path = "/method/photos.getAll"
        let parametrs: Parameters = [
            "access_token": Session.instance.accessToken,
            "v": "5.130",
            "extended": 1,
            "onwer_id": onwerId,
            "count": 200
        ]
        let url = baseurl+path
        
        AF.request(url, method: .get, parameters: parametrs).responseData { response in
            guard let data = response.value else { return }
            do{
                let getPhoto = try JSONDecoder().decode(PhotoResponse.self, from: data).response
                complition(getPhoto.items)
            }catch {
                print(error.localizedDescription)
            }
            
            
        }
        
        
    }
    
    

}
