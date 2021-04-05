//
//  FriendsController.swift
//  Vkontakte
//
//  Created by Игорь Наумов on 17.02.2021.
//

import UIKit
import Foundation

class FriendsController: UITableViewController {
    
    let getFriendsVK = NetWorkService()
    
    var friends = [Friends]()
    
    
    var friendsIndex: [String] = []
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Мои Друзья"
        getFriendsVK.loadFriendsFromVK () { [weak self] friend in
            self?.friends = friend
            self?.tableView.reloadData()
            
        }
        
        
        
        
        indexCreate()
        
        
        
        
    }
    func indexCreate() {
        var tempIndex:[String] = []
        for item in friends {
            tempIndex.append(String(item.last_name.first!))
            
        }
        friendsIndex = Array(Set(tempIndex)).sorted()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int { return 1 }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { friends.count }
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendCellTableViewCell
        let user = friends[indexPath.row]
        //let avatarUrl = user.photo_50
        
        cell.userName.text = "\(user.first_name) \(user.last_name)"
        cell.configure(with: user)
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FriendsFoto",
           let index = tableView.indexPathForSelectedRow,
           let photoAlbum = segue.destination as? FriendsPhotoController {
            let friend = friends[index.row]
            photoAlbum.friend = friend
            photoAlbum.onwerId = friend.id
        }
    }
}





