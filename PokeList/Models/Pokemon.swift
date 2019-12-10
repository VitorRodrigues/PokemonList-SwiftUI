//
//  Pokemon.swift
//  PokeList
//
//  Created by Vitor do Nascimento Rodrigues on 04/11/19.
//  Copyright © 2019 Vitor do Nascimento Rodrigues. All rights reserved.
//

import Foundation

/*
 {
   "id": 1,
   "num": "001",
   "name": "Bulbasaur",
   "img": "http://www.serebii.net/pokemongo/pokemon/001.png",
   "type": [
     "Grass",
     "Poison"
   ],
   "height": "0.71 m",
   "weight": "6.9 kg",
   "candy": "Bulbasaur Candy",
   "candy_count": 25,
   "egg": "2 km",
   "spawn_chance": 0.69,
   "avg_spawns": 69,
   "spawn_time": "20:00",
   "multipliers": [1.58],
   "weaknesses": [
     "Fire",
     "Ice",
     "Flying",
     "Psychic"
   ],
   "next_evolution": [{
     "num": "002",
     "name": "Ivysaur"
   }, {
     "num": "003",
     "name": "Venusaur"
   }]
 }
 */

struct Pokemon: Identifiable, Codable {
    var id: Int
    var name: String
    var type: [String]
    var img: String?
    var weaknesses: [String]
}
