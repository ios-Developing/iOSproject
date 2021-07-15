//
//  UserGroupViewController.swift
//  VK PLUS
//
//  Created by Dmitry on 14.07.2021.
//

import UIKit

class AllGroupViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableViewGroup: UITableView!
    
    var groups = [UsersGroup]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groups = UsersStorage().allGroups
        
        tableViewGroup.delegate = self
        tableViewGroup.dataSource = self
        
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
