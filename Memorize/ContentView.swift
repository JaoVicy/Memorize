//
//  ContentView.swift
//  Memorize
//
//  Created by João Víctor Benetti Filipim on 28/04/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    // Layout for grid.
    let gridLayout = [GridItem(.adaptive(minimum: 80))]
    
    var body: some View {
        HStack {
            LazyVGrid(columns: gridLayout, spacing: 10) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit) // Define a proporção do cartão
                        .onTapGesture {
                            viewModel.choose(card: card)
                        }
                }
            }
        }
        .padding()
        .foregroundColor(Color.cyan)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack() {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(Color.white)
                
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(lineWidth: 3)
                
                Text(card.content)
                    .font(.largeTitle)  // Ajuste o tamanho da fonte
            } else if card.isMatched {
                RoundedRectangle(cornerRadius: 10.0)
                    .opacity(0)  // Esconde o cartão se ele foi combinado
            } else {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(Color.cyan)  // Cor para cartões virados para baixo
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
