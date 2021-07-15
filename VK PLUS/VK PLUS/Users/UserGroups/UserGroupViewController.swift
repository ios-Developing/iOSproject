//
//  UserGroupViewController.swift
//  VK PLUS
//
//  Created by Dmitry on 15.07.2021.
//

import UIKit

class UserGroupViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet private var tableViewUserGroup: UITableView!
    
    var groups: [UsersGroup] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groups = UsersStorage().UserGroups
        
        tableViewUserGroup.delegate = self
        tableViewUserGroup.dataSource = self
        
    }
    
    // Функция добавления группы
    @IBAction func addGroup(_ segue: UIStoryboardSegue) {
        guard
            segue.identifier == "addGroup",
            let sourceController = segue.source as? AllGroupViewController,
            let indexPath = sourceController.tableViewGroup.indexPathForSelectedRow
        else {
            return
        }
        let group = sourceController.groups[indexPath.row]
        
        if !groups.contains(where: {$0.name == group.name}) {
            groups.append(group)
            tableViewUserGroup.reloadData()
        }
    }
    
    // Функция удаления группы
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // Если была нажата кнопка «Удалить»
        if editingStyle == .delete {
            // Удаляем из массива
            groups.remove(at: indexPath.row)
            // И удаляем строку из таблицы
            tableViewUserGroup.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: GroupTableViewCell.reusedIdentifier, for: indexPath) as? GroupTableViewCell
        else {
            return UITableViewCell()
        }
        let group = groups[indexPath.row]
        cell.configure(group: group)
        return cell
    }
}
