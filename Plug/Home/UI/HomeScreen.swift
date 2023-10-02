//
//  HomeScreen.swift
//  Plug
//
//  Created by Nqobani Zulu P on 2023/08/10.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var viewModel = HomeViewModel()
    var body: some View {
        TabView {
            PrimaryButton(title: "Signout") {
                viewModel.signOut()
            }
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("Friends")
                }
            
            ChatListScreen()
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Chat")
                }
            
            UserProfileScreen()
                .tabItem {
                    Image(systemName: "3.circle")
                    Text("Profile")
                }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
