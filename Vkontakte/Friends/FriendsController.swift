//
//  FriendsController.swift
//  Vkontakte
//
//  Created by Игорь Наумов on 17.02.2021.
//

import UIKit
import Foundation

class FriendsController: UITableViewController {
    //let loadFriend = LoadFriends()
    var friends = [MyFriend]()
    
 
    
    //var friendsIndex: [String] = []
    
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Мои Друзья"
       
        
        
        GetFriends.loadFriendsFromVK()
        
       
        indexCreate()
        
        
        
        
    }
    func indexCreate() {
        var tempIndex:[String] = []
        for item in friends {
            tempIndex.append(String(item.lastName.first!))
        }
        //friendsIndex = Array(Set(tempIndex)).sorted()
    }
    
    // MARK: - Table view data source
    
    
    override func numberOfSections(in tableView: UITableView) -> Int { return friends.count }
    
    
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
//        view.backgroundColor = .blue
//        let label = UILabel(frame: CGRect(x: 15, y: 5, width: tableView.frame.width, height: 20))
//        label.textColor = .white
//        label.text = (friends[section])
//
//        view.addSubview(label)
//        return view
//
//    }
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendCellTableViewCell
////        let item = friends.filter { (friends) -> Bool in
////            friendsIndex[indexPath.section] == String(friends.lastName.first!)
//
//        }
//        cell.userName.text = friends[indexPath.row].firstName
//        cell.userLastname.text = friends[indexPath.row].lastName
//        let url = URL(string: friends[indexPath.row].avatar)
//        cell.userAvatar.image = UIImage(data: try! Data(contentsOf: url!))!
        //let friend = friends[indexPath.row]
        //        cell.userName.text = "\(friend.name) \(friend.surname)"
        //        cell.userName.adjustsFontSizeToFitWidth = true
        //        cell.userName.minimumScaleFactor = CGFloat(10)
        //        cell.userAvatar.image = friend.avatar
        //        cell.setup(item: items[indexPath.row])uj
        
        //return cell
    //}
//    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
//        return friendsIndex
//    }
    
    
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        if segue.identifier == "fotoAlbumSegue" {
    //            let photoAlbum = segue.destination as! PhotoAlbumController
    //            if let index = tableView.indexPathForSelectedRow{
    //                let friend = friends[index.row]
    //                photoAlbum.photos = friends.photos
    //                photoAlbum.title = "\(friend.name) \(friend.surname)"
    //            }
    //        }
    //    }
    
}


