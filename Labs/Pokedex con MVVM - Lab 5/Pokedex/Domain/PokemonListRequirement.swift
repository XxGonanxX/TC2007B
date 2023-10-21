//
//  PokemonListRequirement.swift
//  Pokedex
//
//  Created by Alan Patricio González Bernal on 20/10/23.
//

import Foundation

protocol PokemonListRequirementProtocol {
    func getPokemonList(limit: Int) async -> Pokedex?
}

class PokemonListRequirement: PokemonListRequirementProtocol {
    
    // Este static let shared es un "singleton", me sirven para darle un acceso global a externos a la clase. Veremos varios así para cada clase, e incluso otras cosas.
    static let shared = PokemonListRequirement()

    func getPokemonList(limit: Int) async -> Pokedex? {
        return await dataRepository.getPokemonList(limit: limit)
    }
    
    let dataRepository: PokemonRepository
    
    init(dataRepository: PokemonRepository = PokemonRepository.shared) {
        self.dataRepository = dataRepository
    }
    

}
