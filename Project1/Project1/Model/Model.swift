//
//  Model.swift
//  Project1
//
//  Created by Dmitry on 27/2/24.
//

import Foundation

struct FriendResponse: Decodable {
    var response: Friends
}

struct Friends: Decodable {
    var items: [Friend]
}

struct Friend: Decodable, Hashable {
    var photo: String
    var firstName: String
    var lastName: String
    
    enum CodingKeys: String, CodingKey {
        case photo = "photo_50"
        case firstName = "first_name"
        case lastName = "last_name"
    }
}


