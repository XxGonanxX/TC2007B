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
