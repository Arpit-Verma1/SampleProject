//
//  Untitled.swift
//  SampleProject
//
//  Created by Arpit Verma on 12/15/25.
//

import Combine
import Foundation

@MainActor
class UserViewModal : ObservableObject {
    
    @Published var users : [UserModal] = []
    @Published var isLoading : Bool = true
    @Published var errorMessage : String?
    
    private var networkService  = NetworkService.shared
    
    func fetchUsers () async {
        isLoading = true
        do {
            
            self.users = try await networkService.fetchUsers()
            print("users \(users)")
        }
        catch {
            self.errorMessage = error.localizedDescription
        }
        isLoading = false
        
    }
    
}
