//
//  PlugApp.swift
//  Plug
//
//  Created by Nqobani Zulu P on 2023/08/09.
//

import SwiftUI
import FirebaseCore

@main
struct PlugApp: App {
    @StateObject private var viewModel = LoginViewModel()
    init () {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if !viewModel.currentUserId.isEmpty && viewModel.isSignedIn {
                    HomeScreen()
                } else {
                    LoginScreen()
                }
            }
        }
    }
}
