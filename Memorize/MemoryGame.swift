//
//  MemoryGame.swift
//  Memorize
//
//  Created by João Víctor Benetti Filipim on 01/05/25.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
            print("Card choosen: \(card)")
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
        
    }
}
