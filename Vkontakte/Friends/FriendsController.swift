//
//  FriendsController.swift
//  Vkontakte
//
//  Created by Игорь Наумов on 17.02.2021.
//

import UIKit

class FriendsController: UITableViewController {
    
   
    
    var friends: [Friend] = [
        Friend(name: "Игорь", surname: "Наумов", avatar: "bat"),
        Friend(name: "Бэтмен", surname: "Иванов", avatar: "super"),
        Friend(name: "Гоча", surname: "Чивчян", avatar: "news1"),
        Friend(name: "Аркадий", surname: "Цареградцев", avatar: "user2")
    ]
    
    private var  searchFriend: [Friend] = []
    
    var friendsIndex: [String] = []
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false}
        return text.isEmpty
    }
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Мои Друзья"
        
        indexCreate()
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
    }
    func indexCreate() {
        var tempIndex:[String] = []
        for item in friends {
            tempIndex.append(String(item.name.first!))
        }
        friendsIndex = Array(Set(tempIndex)).sorted()
    }
    
    // MARK: - Table view data source
    
    
    override func numberOfSections(in tableView: UITableView) -> Int { return friendsIndex.count }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        view.backgroundColor = .blue
        let label = UILabel(frame: CGRect(x: 15, y: 5, width: tableView.frame.width, height: 20))
        label.textColor = .white
        label.text = (friendsIndex[section])
        
        view.addSubview(label)
        return view
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //friends.count
        if isFiltering {
            return searchFriend.count
        }
        let items = friends.filter { (friend) -> Bool in
            friendsIndex[section] == String(friend.name.first!)
        }
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendCellTableViewCell
        let items = friends.filter { (friend) -> Bool in
            friendsIndex[indexPath.section] == String(friend.name.first!)
            
        }
        let friend: Friend
        if isFiltering {
            friend = searchFriend[indexPath.row]
        }else {
            cell.setup(item: items[indexPath.row])
        }
        //let friend = friends[indexPath.row]
        //        cell.userName.text = "\(friend.name) \(friend.surname)"
        //        cell.userName.adjustsFontSizeToFitWidth = true
        //        cell.userName.minimumScaleFactor = CGFloat(10)
        //        cell.userAvatar.image = friend.avatar
//        cell.setup(item: items[indexPath.row])uj
        
        return cell
    }
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return friendsIndex
    }

   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fotoAlbumSegue" {
            let photoAlbum = segue.destination as! PhotoAlbumController
            if let index = tableView.indexPathForSelectedRow{
                let friend = friends[index.row]
                photoAlbum.photos = friend.photos
                photoAlbum.title = "\(friend.name) \(friend.surname)"
            }
        }
    }

   

}
extension FriendsController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        
        searchFriend = friends.filter({ (friendSearch: Friend) -> Bool in
            return friendSearch.name.lowercased().contains(searchText.lowercased())
        })

        tableView.reloadData()
    }
}
