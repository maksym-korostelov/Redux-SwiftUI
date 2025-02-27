//
//  UserDetailView.swift
//  Redux-SwiftUI
//
//  Created by Maksym Korostelov on 27/02/2025.
//


// UserDetailView.swift
import SwiftUI

struct UserDetailView: View {
    @ObservedObject var store: Store
    @State private var userName: String = ""
    
    var body: some View {
        if let user = store.state.selectedUser {
            VStack(alignment: .leading, spacing: 16) {
                TextField("Name", text: $userName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    saveUser()
                }) {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                }
                .padding()
                .buttonStyle(DefaultButtonStyle())
            }
            .navigationTitle("Edit User")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                self.userName = user.name
            }
        } else {
            EmptyView()
        }
    }
    
    func saveUser() {
        if var user = store.state.selectedUser {
            user.name = userName
            store.dispatch(action: UpdateUserAction(user: user))
            store.dispatch(action: DeselectUserAction())
        }
    }
}