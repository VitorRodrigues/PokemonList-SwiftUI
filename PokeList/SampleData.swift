//
//  SampleData.swift
//  PokeList
//
//  Created by Vitor do Nascimento Rodrigues on 04/11/19.
//  Copyright © 2019 Vitor do Nascimento Rodrigues. All rights reserved.
//

import Foundation

class SampleData {
    static var bulbasaur: Pokemon {
        return Pokemon(id: 1, name: "Bulbasaur", type: ["Grass", "Ground"], img: "", weaknesses: ["Fire, "])
    }
    
    static var pokemons: [Pokemon] {
        return [
            Pokemon(id: 1, name: "Bulbasaur", type: ["Grass"], img: "", weaknesses: ["Fire"]),
            Pokemon(id: 2, name: "Ivysaur", type: ["Grass"], img: "", weaknesses: ["Fire"]),
            Pokemon(id: 3, name: "Venosaur", type: ["Grass"], img: "", weaknesses: ["Fire"]),
            Pokemon(id: 4, name: "Charmander", type: ["Fire"], img: "", weaknesses: ["Fire"]),
            Pokemon(id: 5, name: "Charmeleon", type: ["Fire"], img: "", weaknesses: ["Fire"]),
        ]
    }
}

