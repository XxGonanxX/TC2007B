//
//  UserRepository.swift
//  Pokedex
//
//  Created by Alan Patricio González Bernal on 21/10/23.
//

import Foundation

protocol UserServiceProtocol {
    func getCurrentUser() -> String?
    func setCurrentUser(email:String)
    func removeCurrentUser()
}


class UserRepository: UserServiceProtocol {
    static let shared = UserRepository()
    
    var localService = LocalService()
    
    init(localService: LocalService = LocalService.shared) {
        self.localService = localService
    }
    
    func getCurrentUser() -> String? {
        self.localService.getCurrentUser()
    }
    
    func setCurrentUser(email: String) {
        self.localService.setCurrentUser(email: email)
    }
    
    func removeCurrentUser() {
        self.localService.removeCurrentUser()
    }
}
