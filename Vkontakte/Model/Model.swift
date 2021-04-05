//
//  Model.swift
//  Vkontakte
//
//  Created by Игорь Наумов on 18.03.2021.
//

import Foundation

class Session {
    private init(){}
    static let instance = Session()
    
    var userID = Int()
    var accessToken = String()
}
