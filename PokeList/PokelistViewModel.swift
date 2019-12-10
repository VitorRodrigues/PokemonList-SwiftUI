//
//  PokelistViewModel.swift
//  PokeList
//
//  Created by Vitor do Nascimento Rodrigues on 06/11/19.
//  Copyright © 2019 Vitor do Nascimento Rodrigues. All rights reserved.
//

import Foundation
import Combine

class PokeListViewModel: ObservableObject {
    
    @Published var pokemons: [Pokemon] = []
    
    var disposables = Set<AnyCancellable>()
    
    func fetchList() {
        PokeService()
            .fetchPokemons()
            .map { response in
                response.pokemon
            }
        .receive(on: DispatchQueue.main)
        .sink(receiveCompletion: { [weak self] (value) in
            guard let self = self else { return }
            switch value {
            case .failure:
                self.pokemons = []
            case .finished:
                break
            }
            },
              receiveValue: { [weak self] list in
                guard let self = self else { return }
                self.pokemons = list
        })
        .store(in: &disposables)
    }
}

struct PokedexResponse: Codable {
    var pokemon: [Pokemon]
}

enum PokemonError : Error{
    case network(String)
    case parse(String)
    case api(Error)
}
protocol PokemonFetchable {
    func fetchPokemons() -> AnyPublisher<PokedexResponse, PokemonError>
}

class PokeService: PokemonFetchable {
    
    let contentUrl = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json"

    func fetchPokemons() -> AnyPublisher<PokedexResponse, PokemonError> {
        
        guard let url = URL(string: contentUrl) else {
            return Fail(error: PokemonError.network("Can't create URL")).eraseToAnyPublisher()
        }
        
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .mapError { error in
                return PokemonError.api(error)
            }
        .flatMap(maxPublishers: .max(1)) { pair in
            return self.decode(pair.data)
        }
        .eraseToAnyPublisher()
    }
    
    
    func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, PokemonError> {
        let decoder = JSONDecoder()
        
        return Just(data)
            .decode(type: T.self, decoder: decoder)
            .mapError { error in
                return .parse(error.localizedDescription)
            }
            .eraseToAnyPublisher()
    }
}
