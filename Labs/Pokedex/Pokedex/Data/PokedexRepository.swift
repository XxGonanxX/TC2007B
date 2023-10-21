//
//  PokedexRepository.swift
//  Pokedex
//
//  Created by Alan Patricio González Bernal on 16/10/23.
//

import Foundation

struct API {
    static let base = "https://pokeapi.co/api/v2/"
    
    struct routes {
        static let pokemon = "/pokemon"
    }
}

// La palabra reservada protocol me permite heredarla en otras clases
protocol PokemonAPIProtocol {
    //https://pokeapi.co/api/v2/pokemon/limit=1279
    // El signo de interrogación al final del Pokedex es para darle a entender a limit que nos puede regresar un null.
    func getPokemonList(limit: Int) async -> Pokedex?
    
    //https://pokeapi.co/api/v2/pokemon/{number_pokemon}/
    func getPokemonInfo(numberPokemon: Int) async -> Perfil?
    
}

class PokemonRepository: PokemonAPIProtocol {
    let nservice: NetworkAPIService
    
    static let shared = PokemonRepository()
    
    init(nservice: NetworkAPIService = NetworkAPIService.shared){
        // Aquí definimos el servicio de la API nuestra.
        self.nservice = nservice
    }
    
    func getPokemonList(limit: Int) async -> Pokedex? {
        // Esta es una función asincrónica, nuestra API llama la url, en este caso, la API de pokemon

        return await nservice.getPokedex(url: URL(string:"\(API.base)\(API.routes.pokemon)")!, Limit: limit)
   
    }
    
    func getPokemonInfo(numberPokemon: Int) async -> Perfil? {
        // el nil es para decir que se entrega un nulo.
        return await nservice.getPokemonInfo(url: URL(string:"\(API.base)\(API.routes.pokemon)/\(numberPokemon)")!)
    }
}

