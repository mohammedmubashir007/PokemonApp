//
//  PokemonGridView.swift
//  PokemonCards
//
//  Created by Mohammed Mubashir on 03/03/23.
//

import SwiftUI

struct PokemonGridView: View {
    
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]

    @ObservedObject var viewModel = PokemonViewModel()

    
    var body: some View {
        NavigationView {
              ZStack {
                  //gradient background
                  LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.2), Color.pink
                      .opacity(0.3)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                      .edgesIgnoringSafeArea(.all)
                  ScrollView {
                      LazyVGrid(columns: gridItems, spacing: 16) {
                      
                  // parsing through all the data from api and model
                          ForEach(viewModel.pokemon) { pokemon in
                              NavigationLink {
                                  PokemonDetailView(viewModel: viewModel, pokemon: pokemon)
                              } label: {
                                  PokemonCell(pokemon: pokemon, viewModel: viewModel)
                              }

                          }
                      }
                  }.navigationTitle("Pokemon Club \(viewModel.pokemon.count)")
              }
           
          }.navigationBarHidden(true)    }
}

struct PokemonGridView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonGridView()
    }
}
