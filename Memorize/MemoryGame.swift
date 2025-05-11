import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable { // Adiciona Equatable para comparar conteúdos
    var cards: Array<Card>
    
    mutating func choose(card: Card) {
        // Encontra o índice da carta escolhida
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {
            // Vira a carta para cima
            cards[chosenIndex].isFaceUp = true
            
            // Verifica se há outra carta virada para cima
            let faceUpCardsIndices = cards.indices.filter { cards[$0].isFaceUp && !cards[$0].isMatched }
            if faceUpCardsIndices.count == 2 {
                let firstIndex = faceUpCardsIndices[0]
                let secondIndex = faceUpCardsIndices[1]
                
                // Lógica de match: verifica se os conteúdos das cartas combinam
                if cards[firstIndex].content == cards[secondIndex].content {
                    // Marca as cartas como combinadas
                    cards[firstIndex].isMatched = true
                    cards[secondIndex].isMatched = true
                } else {
                    // Caso contrário, vira as cartas para baixo
                    cards[firstIndex].isFaceUp = false
                    cards[secondIndex].isFaceUp = false
                }
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false // Inicia como virado para baixo
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
