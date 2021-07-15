//
//  UresTableViewCell.swift
//  VK PLUS
//
//  Created by Dmitry on 14.07.2021.
//

import UIKit

// Ячейки пельзователей
final class UserTableViewCell: UITableViewCell {
    
    static let reusedIdentifier = "UserTableViewCell"
    
    @IBOutlet private var avatarImageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    
    func configure(user: UsersProfile) {
        print(user.avatarName)
        avatarImageView.image = UIImage(named: user.avatarName)
        nameLabel.text = user.name + " " + user.surename
    }
}
// Ячейки группы
final class GroupTableViewCell: UITableViewCell {
    
    static let reusedIdentifier = "GroupTableViewCell"
    
    @IBOutlet private var avatarGroupImageView: UIImageView!
    @IBOutlet private var groupNameLabel: UILabel!
    
    func configure(group: UsersGroup) {
        avatarGroupImageView.image = UIImage(named: group.avatarName)
        groupNameLabel.text = group.name + "\n(\(group.description))"
    }
}

final class CollectionViewPhotoCell: UICollectionView {
    
    static let reusedIdentifier = "CollectionViewPhotoCell"
    
   // @IBOutlet private var avatarImageCollectionView: UIImageView!
    
    func configure(photo: UsersGroup) {
     //   avatarImageCollectionView.image = UIImage(named: photo.avatarName)
    }
}
