//
//  Friends.swift
//  Vkontakte
//
//  Created by Игорь Наумов on 17.02.2021.
//
import Foundation
import Alamofire

struct FriendVK: Codable {
    let response: ResponseVK
}
struct ResponseVK: Codable {
    let count: Int
    let items: [Friends]
}
struct Friends: Codable {
    let id: Int
    let first_name: String
    let last_name: String
    let is_closed: Bool
    let can_access_closed: Bool
    let track_code: String
    let photo_50: String
}



