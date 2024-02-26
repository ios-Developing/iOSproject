//
//  NewViewController.swift
//  Project1
//
//  Created by Dmitry on 25/2/24.
//

import UIKit

class TableViewUsers: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        // tableView.separatorStyle = .none
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .white
        title = "Friends"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        CustomTableUsersCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { // выбор ячейки и переход на TableViewMessages()
        navigationController?.pushViewController(TableViewMessages(), animated: true)
    }
}
