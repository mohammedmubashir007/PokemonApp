//
//  PokemonCell.swift
//  PokemonCards
//
//  Created by Mohammed Mubashir on 03/03/23.
//

import SwiftUI
import Kingfisher

let samplePokemon = PokemonModel(id: 1, name: "Pokemon", attack: 20, defense: 12, description: "The best Pokemon", imageUrl: "https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2F2CF15848-AAF9-49C0-90E4-28DC78F60A78?alt=media&token=15ecd49b-89ff-46d6-be0f-1812c948e334", type: "poison", weight: 50, height: 500)

let SampleVM = PokemonViewModel()

struct PokemonCell: View {
    let pokemon : PokemonModel
    let viewModel:PokemonViewModel
    
    
    var body: some View {
        ZStack {
                   
                   VStack(alignment: .leading) {
                       //pokemon Name
                       Text(pokemon.name.capitalized)
                           .font(.system(size: 20, weight:.semibold, design: .serif))
                           .foregroundColor(.black)
                           .padding(.top, 20)
                           .padding(.leading)
                       
                       HStack {
                           //Pokemon type
                           Text(pokemon.type.capitalized)
                               .font(.system(size: 16, weight: .medium, design: .serif))
                               .foregroundColor(.black)
                               .padding(.horizontal, 16)
                               .padding(.vertical, 8)
                               .overlay(
                               RoundedRectangle(cornerRadius: 14)
                                   .fill(Color.white.opacity(0.2))
                               )
                               .frame(width: 100, height: 24)
                           
       //MARK: - Install a package named kingfisher to add url image from internet to our project and perform functions
                           
                           KFImage(URL(string: pokemon.imageUrl))
                               .resizable()
                               .scaledToFit()
                               .frame(width: 68, height: 68)
                               .padding([.bottom,.trailing], 4)
                       }
                   }
               }
               // each cared's background and design
               .background(Color(viewModel.backgroundColor(forType: pokemon.type)).opacity(0.3))
               .clipShape(RoundedRectangle(cornerRadius: 30))
                   .padding(.all, 6)
                   .clipShape(RoundedRectangle(cornerRadius: 30))
                   .shadow(color: .black.opacity(0.4), radius: 8, x: 8, y: 8)
                   .shadow(color: .white.opacity(0.2), radius: 10, x: -10, y: -10)
                 
             
    }
}

struct PokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCell(pokemon: samplePokemon, viewModel: SampleVM)
    }
}
