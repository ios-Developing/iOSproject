//
//  AppView.swift
//  Project1
//
//  Created by Dmitry on 27/2/24.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct AppView: View {
    
    @EnvironmentObject var loginViewModel: LoginViewModel
    @ObservedObject var friendsViewModel = FriendsViewModel()
    
    @State var friends = [Friend]()
    
    var body: some View {
        ZStack {
            ScrollView(.vertical) {
                LazyVStack{
                    ForEach(friends, id: \.self) { friend in
                        FriendItem(name: friend.firstName, sureName: friend.lastName, photo: friend.photo)
                    }
                }
            }
            .padding(.top, 50)
            .onAppear{
                print(loginViewModel.token)
                friendsViewModel.getFriends(token: loginViewModel.token) { friends in
                    self.friends = friends
                    print(friends)
                }
            }
        }
    }
}
struct FriendItem: View {
    var name: String
    var sureName: String
    var photo: String
    
    var body: some View {
        HStack {
            WebImage(url: URL(string: photo))
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(name)
                    .font(.system(size: 18, weight: .black))
                    .padding(.bottom, 2)
                Text(sureName)
                    .font(.system(size: 18, weight: .bold))
                    .padding(.bottom, 2)
            }
        }
        .padding(10)
        .padding(.leading, 10)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
