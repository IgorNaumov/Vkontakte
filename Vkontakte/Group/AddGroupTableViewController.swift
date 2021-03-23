//
//  AddGroupTableViewController.swift
//  Vkontakte
//
//  Created by Игорь Наумов on 17.02.2021.
//

import UIKit

class AddGroupTableViewController: UITableViewController {
   
    
    let newGroups: [Group] = [
        Group(name: "GeekBrains", avatar: "heart"),
        Group(name: "Moscow online", avatar: ""),
        Group(name: "Pizza", avatar: "new2"),
        Group(name: "Spider club", avatar: "")
        ]
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Поиск Групп"
        
        

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int { 1 }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

       return newGroups.count
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newGroupCell", for: indexPath) as! AddGroupTableViewCell
        
       
        
        let group = newGroups[indexPath.row]
        cell.groupImageView.image = group.avatar
        cell.groupNameLabel.text = group.name

        return cell
    }
    
  
    
   
   
    
}
    



    


 
