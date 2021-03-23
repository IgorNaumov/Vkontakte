//
//  News.swift
//  Vkontakte
//
//  Created by Игорь Наумов on 20.02.2021.
//

import UIKit

struct  News {
    var nameUser: String
    var dateNews: String
    var avatarUser: UIImage?
    var photosNews: UIImage?
    var labelNews: String?
    
    init(nameUser: String, dateNews: String, avatarUser: String, photosNews: String, labelNews: String ) {
        self.nameUser = nameUser
        self.dateNews = dateNews
        self.avatarUser = UIImage(named: avatarUser)
        self.photosNews = UIImage(named: photosNews)
        self.labelNews = labelNews
        
      
        }
    }

