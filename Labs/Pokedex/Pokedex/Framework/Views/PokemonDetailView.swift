//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Alan Patricio González Bernal on 21/10/23.
//

import SwiftUI
import SDWebImageSwiftUI


struct PokemonDetailView: View {
    var pokemonBase: PokemonBase
    
    var body: some View {
        WebImage(url: URL(string: pokemonBase.perfil?.sprites.front_default ?? ""))
        Text("ID: ")
        Text(pokemonBase.id.description)
        Text(pokemonBase.pokemon.name).font(.largeTitle)
        
    }
}
