//
//  PokemonAPIProtocol.swift
//  Pokedex
//
//  Created by Alan Patricio González Bernal on 15/10/23.
//

import Foundation

// La palabra reservada protocol me permite heredarla en otras clases
protocol PokemonAPIProtocol{
    //https://pokeapi.co/api/v2/pokemon/limit=1279
    // El signo de interrogación al final del Pokedex es para darle a entender a limit que nos puede regresar un null.
    func getPokemonList(limit: Int) async -> Pokedex?
    
    //https://pokeapi.co/api/v2/pokemon/{number_pokemon}/
    func getPokemonInfo(numberPokemon:Int) async -> Perfil?
}
