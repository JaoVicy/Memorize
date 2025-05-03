//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by João Víctor Benetti Filipim on 02/05/25.
//

import SwiftUI

func createCardContent(pairIndex: Int) -> String {
    return "🦄"
}

class EmojiMemoryGame {
    private var model: MemoryGame<String> =
    MemoryGame<String>(numberOfPairsOfCards: 2, cardContentFactory: createCardContent)
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    /*
     class EmojiMemoryGame {
         private(set) var model: MemoryGame<String>
     
     In this form it is necessary to use a new property
    */
    
    // MARK: - Intents(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
