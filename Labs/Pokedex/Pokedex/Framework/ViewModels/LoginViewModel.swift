//
//  LoginViewModel.swift
//  Pokedex
//
//  Created by Alan Patricio González Bernal on 21/10/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    
    var userRequirement: UserRequirementProtocol
    
    init(userRequirement: UserRequirementProtocol = UserRequirement.shared) {
        self.userRequirement = userRequirement
    }
    
    @MainActor
    func getCurrentUser() {
        self.email = self.userRequirement.getCurrentUser() ?? ""
    }
    
    @MainActor
    func setCurrentUser() {
        if self.email != "" {
            self.userRequirement.setCurrentUser(email: self.email)
        } else {
            self.messageAlert = "Correo inválido"
            self.showAlert = true
        }
    }
    
    @Published var messageAlert = ""
    @Published var showAlert = false
}
