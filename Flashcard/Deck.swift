//
//  Desk.swift
//  Flashcard
//
//  Created by Marko Seifert on 26.10.15.
//  Copyright © 2015 T-Systems. All rights reserved.
//

import Foundation

class Deck : NSObject{
    
    var name : String = ""
    var cards : [Card] = []
    
    func createCard(frontText: String, backText: String) -> Card {
        let card = Card()
        card.frontText = frontText
        card.backText = backText
        self.cards.append (card)
        return card;
    }
    
}