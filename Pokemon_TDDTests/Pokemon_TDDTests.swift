//
//  Pokemon_TDDTests.swift
//  Pokemon_TDDTests
//
//  Created by Shawn Li on 6/4/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import XCTest
import Alamofire

@testable import Pokemon_TDD

class Pokemon_TDDTests: XCTestCase
{

    override func setUpWithError() throws
    {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws
    {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testModel() throws
    {
        let pokemon = Pokemon()
        pokemon.height = 12
        pokemon.id = 3
        pokemon.imageUrl = URL(string: "https://www.qq.com/")
        pokemon.name = "MiniQ"
        pokemon.type = "Water"
        pokemon.weight = 23
        
        XCTAssertNotNil(pokemon)
    }

    func testAPI() throws
    {
        var validResponse = false
 
        let expect = expectation(description: "Get Response")
        
        AF.request(AppConstants.NetworkConstants.pokeAPI).response
        { (response) in
            if let responseCode = response.response?.statusCode, responseCode >= 200, responseCode < 300
            {
                validResponse = true
                XCTAssertTrue(validResponse)
            }
            
            if let data = response.data
            {
                XCTAssertNotNil(data)
            }
            
            XCTAssertNil(response.error)
            
            expect.fulfill()
        }
        
        self.wait(for: [expect], timeout: 5)
        
    }
    
    func testViewModel() throws
    {
        let pokeVM = PokemonViewModel()
        let pokemons = pokeVM.pokemons
        XCTAssertNotEqual(pokemons.count,0)
    }
    
    func testController() throws
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tableVC = storyboard.instantiateViewController(identifier: "PokemonController") as! PokemonController
        
        XCTAssertNotEqual(tableVC.pokemonViewModel.pokemons.count, 0)
        
    }
    
    func testPerformanceExample() throws
    {
        // This is an example of a performance test case.
        self.measure {
            
        }
    }

}
