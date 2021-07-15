//
//  FriendsViewController.swift
//  VK PLUS
//
//  Created by Dmitry on 12.07.2021.
//

import UIKit

final class AllUsersViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var users = [UsersProfile]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        users = UsersStorage().allUsers
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension AllUsersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.reusedIdentifier, for: indexPath) as? UserTableViewCell
        else {
            return UITableViewCell()
        }
        let user = users[indexPath.row]
        cell.configure(user: user)
        return cell
    }
}
