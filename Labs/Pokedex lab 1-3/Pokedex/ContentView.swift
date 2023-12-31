//
//  ContentView.swift
//  Pokedex
//
//  Created by Alan Patricio González Bernal on 14/10/23.
//

import SwiftUI
import SDWebImageSwiftUI



struct ContentView: View {
    @State var pokemonList = [PokemonBase]()
    
    var body: some View {
        List(pokemonList) { pokemonBase in
            HStack {
                WebImage(url: URL(string: pokemonBase.perfil?.sprites.front_default ?? ""))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                Text(pokemonBase.pokemon.name)
            }
        }.onAppear {
            Task {
                await getPokemonList()
            }
        }
    }
    
    func getPokemonList() async {
        let pokemonRepository = PokemonRepository()
        let result = await pokemonRepository.getPokemonList(limit: 1279)
        
        var tempPokemonList = [PokemonBase]()
        for pokemon in result!.results {
            let numberPokemon = Int(pokemon.url.split(separator: "/")[5])!
            
            let infoPokemon = await pokemonRepository.getPokemonInfo(numberPokemon: Int(String(numberPokemon))!)
            let tempPokemon = PokemonBase(id: Int(String(numberPokemon))!, pokemon: pokemon, perfil: infoPokemon)
            tempPokemonList.append(tempPokemon)
        }
        pokemonList = tempPokemonList
    }
}

    


