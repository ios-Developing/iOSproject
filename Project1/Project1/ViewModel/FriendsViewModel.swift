//
//  FriendsViewModel.swift
//  Project1
//
//  Created by Dmitry on 27/2/24.
//

import Foundation
import Alamofire

class FriendsViewModel: ObservableObject {

    //@Published var friends = [Friends]()
    
    func getFriends(token: String, completion: @escaping ([Friend]) -> ()) {

        let url = "https://api.vk.com/method/friends.get"
        print(token)
        let params: Parameters = [
            
            "access_token": token,
            "fields": "photo_50",
            "v": "5.199",
            "count": 30
        ]
        
        AF.request(url, method: .post, parameters: params).response { result in
            if let data = result.data {
                if let friends = try? JSONDecoder().decode(FriendResponse.self, from: data).response.items {
                    completion (friends)
                }
            }
        }
    }
}
