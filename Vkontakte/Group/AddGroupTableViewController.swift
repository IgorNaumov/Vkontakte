//
//  AddGroupTableViewController.swift
//  Vkontakte
//
//  Created by Игорь Наумов on 17.02.2021.
//

import UIKit

class AddGroupTableViewController: UITableViewController {
   
    
    let networkService = NetWorkService()
    var groups = [Group]()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Поиск Групп"
        
        

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int { 1 }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return groups.count
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newGroupCell", for: indexPath) as! GroupTableViewCell
        let group = groups[indexPath.row]

        cell.configuregr(with: group)
        return cell
    }
    
  
    
   
   
    
}
    



    


 
