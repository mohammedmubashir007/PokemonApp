//
//  PokemonModel.swift
//  PokemonCards
//
//  Created by Mohammed Mubashir on 03/03/23.
//

import Foundation

struct PokemonModel:Codable,Identifiable {
    let id : Int
    let name : String
    let attack : Int
    let defense : Int
    let description : String
    let imageUrl : String
    let type : String
    let weight : Int
    let height : Int
    
}
