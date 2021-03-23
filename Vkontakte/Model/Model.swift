//
//  Model.swift
//  Vkontakte
//
//  Created by Игорь Наумов on 18.03.2021.
//

import Foundation

class SessionVK {
    private init(){}
    static let instance = SessionVK()
    
    var userID = 0
    var token = ""
}
