//
//  LoginViewModel.swift
//  Plug
//
//  Created by Nqobani Zulu P on 2023/08/09.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init () {
        self.handler = Auth.auth().addStateDidChangeListener{ [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool = Auth.auth().currentUser != nil
    
    func login() {
        guard !username.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Enter a valid user name (Email address) and password"
            return
        }
        
        Auth.auth().signIn(withEmail: username, password: password)
    }
}
