//
//  UserListView.swift
//  Redux-SwiftUI
//
//  Created by Maksym Korostelov on 27/02/2025.
//


// UserListView.swift
import SwiftUI

struct UserListView: View {
    @ObservedObject var store: Store
    
    var body: some View {
        NavigationView {
            List(store.state.users) { user in
                Button(action: {
                    store.dispatch(action: SelectUserAction(user: user))
                }) {
                    Text(user.name)
                }
            }
            .navigationTitle("Users")
            .onAppear {
                fetchUsers()
            }
            .background(
                NavigationLink(
                    destination: UserDetailView(store: store),
                    isActive: Binding(
                        get: { self.store.state.selectedUser != nil },
                        set: { isActive in
                            if !isActive {
                                self.store.dispatch(action: DeselectUserAction())
                            }
                        }
                    ),
                    label: { EmptyView() }
                )
                .hidden()
            )
        }
    }
    
    func fetchUsers() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            let fetchedUsers = [
                User(id: 1, name: "Alice"),
                User(id: 2, name: "Bob"),
                User(id: 3, name: "Charlie")
            ]
            DispatchQueue.main.async {
                self.store.dispatch(action: SetUsersAction(users: fetchedUsers))
            }
        }
    }
}