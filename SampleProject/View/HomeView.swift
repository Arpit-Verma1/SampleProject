//
//  HomeView.swift
//  SampleProject
//
//  Created by Arpit Verma on 12/15/25.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var userVM = UserViewModal()
    @State private var showAlert : Bool = false
    var body: some View {
        NavigationStack {
            
            if userVM.isLoading  {
                ProgressView()
            }
           
            else {
                List (userVM.users) { user in
                    
                    UserProfileView(user: user)
                }
            }
            
            
        }
        .task {
            await userVM.fetchUsers()
        }
    }
}

#Preview {
    HomeView()
}
