//
//  FriendsViewController.swift
//  VK PLUS
//
//  Created by Dmitry on 14.07.2021.
//

import UIKit

final class FriendsViewController: UIViewController {

    @IBOutlet private var tableViewFriends: UITableView!
    
    var friend: [UsersProfile] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        friend = UsersStorage().users
        
        tableViewFriends.delegate = self
        tableViewFriends.dataSource = self
        
    }
}
    extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
            
        // Функция добавления друга
        
        
        @IBAction func addUser(_ segue: UIStoryboardSegue) {
            guard
                segue.identifier == "addUser",
                let sourceController = segue.source as? AllUsersViewController,
                let indexPath = sourceController.tableView.indexPathForSelectedRow
            else {
                return
            }
            let user = sourceController.users[indexPath.row]
            
            if !friend.contains(where: {$0.name == user.name}) {
                friend.append(user)
                tableViewFriends.reloadData()
            }
        }
        
        // Функция удаления друга
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            // Если была нажата кнопка «Удалить»
            if editingStyle == .delete {
                // Удаляем из массива
                friend.remove(at: indexPath.row)
                // И удаляем строку из таблицы
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
        
        func numberOfSections(in tableView: UITableView) -> Int {
            1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            friend.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard
                let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.reusedIdentifier, for: indexPath) as? UserTableViewCell
            else {
                return UITableViewCell()
            }
            let user = friend[indexPath.row]
            cell.configure(user: user)
            return cell
        }
    }
