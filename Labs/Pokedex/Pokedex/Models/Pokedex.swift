//
//  Pokedex.swift
//  Pokedex
//
//  Created by Alan Patricio González Bernal on 14/10/23.
//

import Foundation

struct Pokedex {
    var count: Int
    var results: [Pokemon]
}

struct Pokemon {
    var name: String
    var url: String
}

struct Perfil {
    var sprites: Sprite
}

struct Sprite {
    var front_default: String
    var back_default: String
}

struct PokemonBase: Identifiable {
    var id: Int
    var pokemon: Pokemon
    var perfil: Perfil
}
