//
//  Reducer.swift
//  Redux-SwiftUI
//
//  Created by Maksym Korostelov on 27/02/2025.
//


// Reducer.swift
import Foundation

//public let appStore = Store(reducer: appReducer(state:action:), state: AppState())
//
//func appReducer(state: AppState, action: Action) -> AppState {
//    var state = state
//    
//    switch action {
//    case let action as SetUsersAction:
//        state.users = action.users
//        
//    case let action as SelectUserAction:
//        state.selectedUser = action.user
//        
//    case let action as UpdateUserAction:
//        if let index = state.users.firstIndex(where: { $0.id == action.user.id }) {
//            state.users[index] = action.user
//        }
//        state.selectedUser = action.user
//        
//    case _ as DeselectUserAction:
//        state.selectedUser = nil
//        
//    default:
//        break
//    }
//    
//    return state
//}
