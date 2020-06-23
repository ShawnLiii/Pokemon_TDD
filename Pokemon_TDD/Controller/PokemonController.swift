//
//  PokemonController.swift
//  Pokemon_TDD
//
//  Created by Shawn Li on 6/4/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit

class PokemonController: UITableViewController
{

    private var pokemonViewModel = PokemonViewModel()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        pokemonViewModel.updateHandler = self.tableView.reloadData
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        print(pokemonViewModel.pokemons.count)
        return pokemonViewModel.pokemons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokeCell", for: indexPath) as! PokeCell
        
        return cell
    }
 

}
