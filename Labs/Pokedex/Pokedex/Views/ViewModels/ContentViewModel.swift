//
//  ContentViewModel.swift
//  Pokedex
//
//  Created by Alan Patricio González Bernal on 19/10/23.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var pokemonList = [PokemonBase]()
    
}

func getPokemonList() async {
    let pokemonRepository = PokemonRepository()
    let result = await pokemonRepository.getPokemonList(limit: 1279)
    
    for i in 0...result!.results.count - 1 {
        let numberPokemon = Int(result!.results[i].url.split(separator: "/")[5])!
        
        let infoPokemon = await pokemonRepository.getPokemonInfo(numberPokemon: Int(String(numberPokemon))!)
        let tempPokemon = PokemonBase(id: Int(String(numberPokemon))!, pokemon: result!.results[i],  perfil: infoPokemon )
        
       self.pokemonList.append(tempPokemon)
    }
    
}
