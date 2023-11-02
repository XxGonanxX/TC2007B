//
//  LocalService.swift
//  Pokedex
//
//  Created by Alan Patricio González Bernal on 21/10/23.
//

import Foundation


class LocalService {
    
    static let shared = LocalService()
    
    func getCurrentUser() -> String? {
        return UserDefaults.standard.string(forKey: "currentUser")
    }
    
    func setCurrentUser(email: String) {
        UserDefaults.standard.set(email, forKey: "CurrentUser")
    }
    
    func removeCurrentUser() {
        UserDefaults.standard.removeObject(forKey: "CurrentUser")
    }
    
    
}
