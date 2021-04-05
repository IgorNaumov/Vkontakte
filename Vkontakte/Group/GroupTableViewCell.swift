//
//  GroupTableViewCell.swift
//  Vkontakte
//
//  Created by Игорь Наумов on 17.02.2021.
//

import UIKit
import AlamofireImage

class GroupTableViewCell: UITableViewCell {
    
    @IBOutlet weak var groupNameLabel: UILabel!
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        avatarImageView.layer.cornerRadius = 25
//        avatarImageView.layer.borderColor = UIColor.gray.cgColor
//        avatarImageView.layer.borderWidth = 1
//        clipsToBounds = true
//    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    public func configuregr(with groups: Group){
        groupNameLabel.text = groups.name
        
        let avatarImageViewUrlString = groups.photo_50
        avatarImageView.af.setImage(withURL: URL(string: avatarImageViewUrlString)!)
    }
}

