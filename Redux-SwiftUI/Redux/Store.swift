//
//  Store.swift
//  Redux-SwiftUI
//
//  Created by Maksym Korostelov on 27/02/2025.
//


// Store.swift
import Foundation
import Combine

class Store: ObservableObject {
    @Published private(set) var state: AppState
    private let reducer: (AppState, Action) -> AppState
    private let queue = DispatchQueue(label: "redux-store-queue", qos: .userInitiated)
    
    init(reducer: @escaping (AppState, Action) -> AppState, state: AppState) {
        self.reducer = reducer
        self.state = state
    }
    
    func dispatch(action: Action) {
        queue.sync {
            let newState = self.reducer(self.state, action)
            DispatchQueue.main.async {
                self.state = newState
            }
        }
    }
}
