//
//  ContentViewModel.swift
//  Pokedex
//
//  Created by Alan Patricio González Bernal on 19/10/23.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var pokemonList = [PokemonBase]()
    
    var pokemonListRequirement: PokemonListRequirementProtocol
    var pokemonInfoRequirement: PokemonInfoRequirementProtocol

    init(pokemonListRequirement: PokemonListRequirementProtocol = PokemonListRequirement.shared,
         pokemonInfoRequirement: PokemonInfoRequirementProtocol = PokemonInfoRequirement.shared) {
        self.pokemonListRequirement = pokemonListRequirement
        self.pokemonInfoRequirement = pokemonInfoRequirement
    }
    // El @MainActor hace que esta función se ejecute en el hilo principal.
    @MainActor
    func getPokemonList() async{
        // Lo que ya se ha dicho, el límite debe ser 1279, pero para pruebas lo limitamos a 151
        let result = await pokemonListRequirement.getPokemonList(limit: 1279)
        
        for i in 0...result!.results.count - 1 {
            let numberPokemon = Int(result!.results[i].url.split(separator: "/")[5])!
            
            let infoPokemon = await pokemonInfoRequirement.getPokemonInfo(numberPokemon: Int(String(numberPokemon))!)
            let tempPokemon = PokemonBase(id: Int(String(numberPokemon))!, pokemon: result!.results[i],  perfil: infoPokemon! )
        
            
            self.pokemonList.append(tempPokemon)
        }
        
        
    }
    
}
