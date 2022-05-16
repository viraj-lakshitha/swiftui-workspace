//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Viraj Lakshitha Bandara on 2022-05-07.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    // private access modifier only affect to setter only
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            /**
            let faceUpCardIndicies = cards.indices.filter({ cards[$0].isFaceUp }) // "cards[$0].isFaceUp" is same as "index in cards[index].isFaceUp"
            return faceUpCardIndicies.oneAnOnly // oneAndOnly is a custom value/attribute created using extension
            */
            // Above code is simplified version of following code
            cards.indices.filter({ cards[$0].isFaceUp }).oneAnOnly
        }
        set {
            /**
            for index in cards.indices { // "cards.indices" are same as "0..<cards.count"
                cards[index].isFaceUp = (index == newValue)  // newValue is an in-build param, it is the new value of the indexOfTheOneAndOnlyFaceUpCard
            }
            */
            // Above code is simplified version of following code
            cards.indices.forEach{cards[$0].isFaceUp = ($0 == newValue)}
        }
    }
    
    // "underscore" means, optional key for the input of type Card
    mutating func choose(_ card: Card) { // mutating, means that this function is going to change the this whole struct
        // If your "if" statement starts with "let" keyword then you can't use the && operator, you have to use "," as follows
        if let currIndex = cards.firstIndex(where: { $0.id == card.id }), !cards[currIndex].isFaceUp, !cards[currIndex].isMatched {// $0 means curr item of iterator
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[currIndex].content == cards[potentialMatchIndex].content { // "==" gives an error becasue we define content type as customizable. So to get rid of that we need to define strcuct to behave as Equatable
                    cards[currIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                cards[currIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = currIndex
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = [] // declare empty array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2)) // add duplicate record, because need to have even number of same emojis to play game
            cards.append(Card(content: content, id: pairIndex*2+1)) // add custom id, you can change as you want
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        let id: Int
    }
}

extension Array {
    var oneAnOnly: Element? {
        if count == 1 {
            return first
        } else {
            return nil
        }
    }
}
