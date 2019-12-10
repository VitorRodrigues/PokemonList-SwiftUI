//
//  ContentView.swift
//  PokeList
//
//  Created by Vitor do Nascimento Rodrigues on 04/11/19.
//  Copyright © 2019 Vitor do Nascimento Rodrigues. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @ObservedObject var viewModel: PokeListViewModel
    
    init(viewModel: PokeListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            if viewModel.pokemons.isEmpty {
                VStack {
                    Text("No pokemons here!")
                    Button(action: {
                        self.viewModel.fetchList()
                    }, label: { Text("Load").padding() } )
                }
            } else {
                List(viewModel.pokemons, id: \.id) { p in
                    NavigationLink(destination: PokemonDetailView(pokemon: p)) {
                        PokeCellView(pokemon: p)
                    }
                }.navigationBarTitle("Pokemons")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: PokeListViewModel())
    }
}
