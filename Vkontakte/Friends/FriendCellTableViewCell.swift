//
//  FriendCellTableViewCell.swift
//  Vkontakte
//
//  Created by Игорь Наумов on 17.02.2021.
//

import UIKit

class FriendCellTableViewCell: UITableViewCell {
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var shadowView: Shadow!
    
    @IBOutlet weak var userAvatar: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        userAvatar.layer.borderColor = UIColor.lightGray.cgColor
        userAvatar.layer.borderWidth = 1
        userAvatar.layer.cornerRadius = 25
        clipsToBounds = true
        shadowView.layer.cornerRadius = 25
        
    }
    
    func setup(item: Friend) {
        userName.text = "\(item.name) \(item.surname)"
        userAvatar.image = item.avatar
    }


}
