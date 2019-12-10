//
//  PokeCellView.swift
//  PokeList
//
//  Created by Vitor do Nascimento Rodrigues on 04/11/19.
//  Copyright © 2019 Vitor do Nascimento Rodrigues. All rights reserved.
//

import SwiftUI

struct PokeCellView: View {
    
    var pokemon: Pokemon
    
    var body: some View {
        HStack {
            RemoteImage(withURL: pokemon.img ?? "")
                .frame(width: 50, height: 50, alignment: .center)
            Text(pokemon.name)
            Spacer()
            ForEach(pokemon.type, id: \.self) { pokeType in
                Text(pokeType)
            }
        }
    }
}

struct PokeCellView_Previews: PreviewProvider {
    static var previews: some View {
        PokeCellView(pokemon: SampleData.bulbasaur)
            .previewLayout(.fixed(width: 350, height: 90))
    }
}
