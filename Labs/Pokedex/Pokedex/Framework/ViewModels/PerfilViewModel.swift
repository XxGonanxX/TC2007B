//
//  PerfilViewModel.swift
//  Pokedex
//
//  Created by Alan Patricio González Bernal on 21/10/23.
//

import Foundation

class PerfilViewModel: ObservableObject {
    
    
    @Published var email = ""
    
    var userRequirement: UserRequirementProtocol
    
    init(userRequirement: UserRequirementProtocol = UserRequirement.shared) {
        self.userRequirement = userRequirement
    }
    
    @MainActor
    func getCurrentUser() {
        self.email = self.userRequirement.getCurrentUser() ?? ""
        print(self.email)
    }
    
    @MainActor
        func logOut() {
            self.email = ""
            self.userRequirement.removeCurrentUser()
        }
}
