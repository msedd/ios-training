//
//  FlashcardsModel.swift
//  Flashcard
//
//  Created by Marko Seifert on 26.10.15.
//  Copyright © 2015 T-Systems. All rights reserved.
//

import Foundation

class FlashcardsModel : NSObject{
    
    var decks : [Deck] = []
    
    override init(){
        super.init()
        self.createEnglishDeck()
        self.createRussionDeck()
    }
    
    func createDeck(name : String) -> Deck {
        let deck = Deck()
        deck.name = name;
        self.decks.append(deck)
        return deck
    }
    
    func createEnglishDeck() -> Deck{
    
        let deck = createDeck("Englisch ↔ Deutsch")
        deck.createCard("bird", backText: "Vogel")
        deck.createCard("tree", backText: "Baum")
        deck.createCard("house", backText: "Haus")
        return deck
    }
    func createRussionDeck() -> Deck{
        let deck = createDeck("Russisch ↔ Deutsch")
        deck.createCard("Спасибо", backText: "Danke")
        deck.createCard("А у тебя?", backText: "Und dir")
        deck.createCard("Тоже", backText: "auch")
        deck.createCard("Как дела?",backText:"Wie geht’s")
        deck.createCard("Здравствуйте!", backText: "formeller Gruß")
        
        return deck

    }
}
let flashcardsModel = FlashcardsModel();