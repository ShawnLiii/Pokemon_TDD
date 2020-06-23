//
//  PokemonViewModel.swift
//  Pokemon_TDD
//
//  Created by Shawn Li on 6/4/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class PokemonViewModel
{
    var pokemons = [Pokemon]()
    var updateHandler: () -> Void = {}
    
    init()
    {
        fetchDataSource(){(pokeContainer) in
            self.pokemons = pokeContainer
            self.updateHandler()
        }
    }
}


private func fetchDataSource(handler: @escaping ([Pokemon]) -> ())
{
    var pokeContainer = [Pokemon]()
    
    AF.request(AppConstants.NetworkConstants.pokeAPI).responseJSON
        { (response) in
            
            if let json = response.value
            {
                var pokemonJSON = JSON(json)
                // Remove first nil object
                pokemonJSON.arrayObject?.remove(at: 0)
                
                for item in pokemonJSON
                {
                    let pokemon = Pokemon()
                    let pokeJSON = item.1
                    pokemon.name = pokeJSON["name"].stringValue
                    pokemon.id = pokeJSON["id"].intValue
                    pokemon.description = pokeJSON["description"].stringValue
                    pokemon.type = pokeJSON["type"].stringValue
                    pokemon.imageUrl = pokeJSON["imageUrl"].url!
                    pokemon.height = pokeJSON["height"].intValue
                    pokemon.weight = pokeJSON["weight"].intValue
                    pokeContainer.append(pokemon)
                }
                
            }
            
            handler(pokeContainer)
    }
    
}

