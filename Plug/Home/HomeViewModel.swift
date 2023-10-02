//
//  HomeViewModel.swift
//  Plug
//
//  Created by Nqobani Zulu P on 2023/08/10.
//

import Foundation
import FirebaseAuth

class HomeViewModel: ObservableObject {
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            // Handle error
        }
    }
}
