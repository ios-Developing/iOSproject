//
//  PhotoFriendsViewController.swift
//  VK PLUS
//
//  Created by Dmitry on 15.07.2021.
//

import UIKit

class PhotoFriendsViewController: UIViewController {
    
    @IBOutlet private var tableViewPhotoFriends: UICollectionViewCell!
    
    var photo: [UsersProfile] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photo = UsersStorage().users
        
        //tableViewPhotoFriends.delegate = self
        //tableViewPhotoFriends.dataSource = self
        
    }
}

extension PhotoFriendsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    
    func numberOfItemsInSection(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int  {
        photo.count
    }
    
    //        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //            guard
    //                let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.reusedIdentifier, for: indexPath) as? UserTableViewCell
    //            else {
    //                return UITableViewCell()
    //            }
    //            let user = photo[indexPath.row]
    //            cell.configure(user: user)
    //            return cell
    //        }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewPhotoCell, for: indexPath)
//        else {
//            return UICollectionViewCell()
        return UICollectionViewCell()
        }
    }
