//
//  FriendsPhotoController.swift
//  Vkontakte
//
//  Created by Игорь Наумов on 03.04.2021.
//

import UIKit
import Alamofire



class FriendsPhotoController: UICollectionViewController {
    
    
    let networkService = NetWorkService()
    var photos = [Photo]()
    var friend: Friends!
    var onwerId = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPhotoFriendTest(onwerId: onwerId)
       assert(friend != nil)
        title = "\(friend.first_name) \(friend.last_name)"
        
        
        networkService.loadPhotoFriend(onwerId: onwerId) { [weak self] photo in
            self?.photos = photo
            self?.collectionView.reloadData()
        }
        
    }
    
    
    
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendsPhoto", for: indexPath) as! FriendsPhotoCell
        
        cell.configure(with: photos[indexPath.item])
        
        return cell
    }
}

extension FriendsPhotoController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (collectionView.frame.width / 3).rounded(.down)
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


func loadPhotoFriendTest(onwerId: Int) {
    
    let baseurl = "https://api.vk.com"
    let path = "/method/photos.getAll"
    let parametrs: Parameters = [
        "access_token": Session.instance.accessToken,
        "v": "5.130",
        "extended": 1,
        "onwer_id": onwerId,
        "count": 200
    ]
    let url = baseurl+path
    
    AF.request(url, method: .get, parameters: parametrs).responseData { response in
        guard let data = response.value else { return }
        do{
        print(data)
        }catch{
            print(error.localizedDescription)
        }
    
    
}
}
