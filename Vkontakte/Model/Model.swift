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
    
    var userId = 0
    var token = ""

}
