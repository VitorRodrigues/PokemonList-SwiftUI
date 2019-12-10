//
//  PokemonDetailView.swift
//  PokeList
//
//  Created by Vitor do Nascimento Rodrigues on 07/11/19.
//  Copyright © 2019 Vitor do Nascimento Rodrigues. All rights reserved.
//

import SwiftUI

struct PokemonDetailView: View {
    
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
            RemoteImage(withURL: pokemon.img ?? "")
                .clipShape(Circle())
                .padding()
            Text(pokemon.name)
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: SampleData.bulbasaur)
    }
}
