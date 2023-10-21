//
//  PokemonInfoRequirement.swift
//  Pokedex
//
//  Created by Alan Patricio González Bernal on 20/10/23.
//

import Foundation

protocol PokemonInfoRequirementProtocol {
    func getPokemonInfo(numberPokemon:Int) async -> Perfil?
}

class PokemonInfoRequirement: PokemonInfoRequirementProtocol {
    let dataRepository: PokemonRepository
    
    static let shared = PokemonInfoRequirement()

    init(dataRepository: PokemonRepository = PokemonRepository.shared) {
        self.dataRepository = dataRepository
    }
    
    func getPokemonInfo(numberPokemon:Int) async -> Perfil? {
        return await dataRepository.getPokemonInfo(numberPokemon: numberPokemon)
    }
}
