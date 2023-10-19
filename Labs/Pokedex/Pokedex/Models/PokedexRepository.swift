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

class PokemonRepository: PokemonAPIProtocol {
    let nservice: NetworkAPIService
    
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
