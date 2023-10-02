//
//  UserProfile.swift
//  Plug
//
//  Created by Nqobani Zulu P on 2023/08/09.
//

import Foundation

struct UserProfile: Codable {
    let id: String
    let name: String
    let email: String
    let isOldEnough: Bool
    let registerDate: TimeInterval
}
