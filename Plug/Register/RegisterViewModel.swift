//
//  RegisterViewModel.swift
//  Plug
//
//  Created by Nqobani Zulu P on 2023/08/09.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var usernameErrorMessage: String = ""
    @Published var email: String = ""
    @Published var emailErrorMessage: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var passwordErrorMessage: String = ""
    @Published var isOldEnough: Bool = false
    @Published var ageErrorMessage: String = ""
    
    init () {
        
    }
    
    func hasInvalidInputs() -> Bool {
        var errorDidOccure = false
        if email.trimmingCharacters(in: .whitespaces).isEmpty {
            usernameErrorMessage = "Enter user name"
            errorDidOccure = true
        }
        if username.trimmingCharacters(in: .whitespaces).isEmpty {
            usernameErrorMessage = "Enter user name or email"
            errorDidOccure = true
        }
        if password.trimmingCharacters(in: .whitespaces).isEmpty ||
            confirmPassword.trimmingCharacters(in: .whitespaces) != password.trimmingCharacters(in: .whitespaces) {
            passwordErrorMessage = "Enter the correct password on both text fields"
            errorDidOccure = true
        }
        if !isOldEnough {
            ageErrorMessage = "You must be 18 years old or older to use this app"
            errorDidOccure = true
        }
        return errorDidOccure
    }
    
    func registerNewUser() {
        if !hasInvalidInputs() {
            Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
                if let uid = result?.user.uid {
                    self?.inserUserRecordInTheDatabase(uid: uid)
                } else {
                    //error?.localizedDescription
                }
            }
        }
    }
    
    func inserUserRecordInTheDatabase(uid: String) {
        let newUser = UserProfile(id: uid, name: username, email: email, isOldEnough: isOldEnough, registerDate: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("users").document(uid).setData(newUser.asDictionary())
    }
}
