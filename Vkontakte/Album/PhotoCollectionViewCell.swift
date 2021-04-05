//
//  PhotoCollectionViewCell.swift
//  Vkontakte
//
//  Created by Игорь Наумов on 17.02.2021.
//

import UIKit
import AlamofireImage

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    
    
    public func configure(with photo: Photo) {
        let friendPhotoUrlString = photo.photoUrl
        photoImageView.af.setImage(withURL: URL(string: friendPhotoUrlString)!)
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        
        photoImageView.image = nil
    }
    
}
    
  




