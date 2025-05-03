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
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(isFaceUp: false, isMatched: false, content: content))
            cards.append(Card(isFaceUp: false, isMatched: false, content: content))
        }
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
        
    }
}
