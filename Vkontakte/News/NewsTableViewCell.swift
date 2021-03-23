//
//  NewsTableViewCell.swift
//  Vkontakte
//
//  Created by Игорь Наумов on 20.02.2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var labelNewsUser: UILabel!
    @IBOutlet weak var avatarUserNewws: UIImageView!
    @IBOutlet weak var dateNew: UILabel!
    @IBOutlet weak var labelNews: UILabel!
    @IBOutlet weak var photoNews: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
