//
//  Action.swift
//  Redux-SwiftUI
//
//  Created by Maksym Korostelov on 27/02/2025.
//


// Actions.swift
import Foundation

protocol Action {}

struct SetUsersAction: Action {
    let users: [User]
}

struct SelectUserAction: Action {
    let user: User
}

struct UpdateUserAction: Action {
    let user: User
}

struct DeselectUserAction: Action {}