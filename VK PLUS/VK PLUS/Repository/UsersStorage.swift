//
//  FriendsStorage.swift
//  VK PLUS
//
//  Created by Dmitry on 13.07.2021.
//

import Foundation

class UsersStorage {
    let users: [UsersProfile]
    let allUsers: [UsersProfile]
    let UserGroups: [UsersGroup]
    let allGroups: [UsersGroup]
    
    init() {
        users = [
            UsersProfile(name: "Олег", surename: "Медведев", avatarName: "Morfeus")
        ]
        allUsers = [
            UsersProfile(name: "Олег", surename: "Медведев", avatarName: "Morfeus"),
            UsersProfile(name: "Маша", surename: "Петрова", avatarName: "Trinity"),
            UsersProfile(name: "Семен", surename: "Степанов", avatarName: "AgentSmith")
        ]
        allGroups = [
            UsersGroup(name: "Земляне", avatarName: "People", description: "Обычные люди"),
            UsersGroup(name: "Марсиане", avatarName: "Martians", description: "Жители Марса"),
            UsersGroup(name: "Титяне 🤣", avatarName: "Titanians", description: "Жители Титана"),
            UsersGroup(name: "Андромедяны", avatarName: "Andromedians", description: "Эти вообще не местные")
        ]
        
        UserGroups = [
            UsersGroup(name: "Земляне", avatarName: "People", description: "Обычные люди")
            ]
        }
    }
