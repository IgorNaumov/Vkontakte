//
//  GroupsController.swift
//  Vkontakte
//
//  Created by Игорь Наумов on 17.02.2021.
//

import UIKit
import Foundation

class GroupsController: UITableViewController {
 
    
    
    
    
    let getGroupsVK = NetWorkService()
    var groups = [Group]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Мои Группы"
        
        getGroupsVK.loadGroupsFromVK() { [weak self] group in
            self?.groups = group
            self?.tableView.reloadData()
        }
//        getGroupsVK.loadGroupsFromVK() { [weak self] group in
//            self?.groups = group
//            self?.tableView.reloadData()
//        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

  
    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return groups.count }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as! GroupTableViewCell
        let gr = groups[indexPath.row]
        cell.groupNameLabel.text = gr.name
        cell.configuregr(with: gr)
        return cell

    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let groupToDelete = groups[indexPath.row]
            groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)

            groups.removeAll { group -> Bool in
                return group.name == groupToDelete.name
            }
        }
    }

//    @IBAction func addNewGroup(segue: UIStoryboardSegue) {
//        if segue.identifier == "addNewGroup" {
//            guard let addGroupController = segue.source as? AddGroupTableViewController else { return }
//            if let indexPath = addGroupController.tableView.indexPathForSelectedRow {
//                let group = addGroupController.newGroups[indexPath.row]
//                //if !groups.contains(group) {
//                groups.append(groups)
//                tableView.reloadData()
//
//                }
//            }
//        }
    }




