//
//  PhotoAlbumController.swift
//  Vkontakte
//
//  Created by Игорь Наумов on 17.02.2021.
//

import UIKit



class PhotoAlbumController: UICollectionViewController {
    
    
    var photos = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()

      
       

        // Do any additional setup after loading the view.
    }

    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int { 1 }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {photos.count}

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCollectionViewCell
        cell.photoImageView.image = photos[indexPath.row]
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    

}
