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
                WebImage(url: URL(string: pokemonBase.perfil.sprites.front_default))
                   .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
                   .scaledToFit()
                   .frame(width: 48, height: 48, alignment: .center)
                Text(pokemonBase.pokemon.name)
            }
        }
    }
}

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            let pokemon = Pokemon(name: "bulbasaur", url: "")
            let pokemon2 = Pokemon(name: "charmander", url: "")
            let pokemon3 = Pokemon(name: "squirtle", url: "")
            let perfil = Perfil(sprites: Sprite(front_default: "", back_default: ""))
            let perfil2 = Perfil(sprites: Sprite(front_default: "", back_default: ""))
            let perfil3 = Perfil(sprites: Sprite(front_default: "", back_default: ""))
            let pokemonBase = PokemonBase(id: 1, pokemon: pokemon, perfil: perfil)
            let pokemonBase2 = PokemonBase(id: 2, pokemon: pokemon2, perfil: perfil2)
            let pokemonBase3 = PokemonBase(id: 3, pokemon: pokemon3, perfil: perfil3)
            
            let pokemonList : [PokemonBase] = [pokemonBase, pokemonBase2, pokemonBase3]
            
            ContentView(pokemonList: pokemonList)
        }
    }


