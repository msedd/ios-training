//
//  Desk.swift
//  Flashcard
//
//  Created by Marko Seifert on 26.10.15.
//  Copyright © 2015 T-Systems. All rights reserved.
//

import Foundation
import CoreData

class Deck : NSManagedObject{
    
    static let EntityName = "Deck"
    
    var cardsToLearn : [Card] {
        get {
            let cards = Array(self.cards ?? [])
            return cards.filter { (c:Card) -> Bool in
                return c.scheduleDate == nil || c.scheduleDate!.isInPast()
                //return
            }
        }
    }
    
    func createCard(frontText: String, backText: String) -> Card {
        
        let card = NSEntityDescription.insertNewObjectForEntityForName(Card.EntityName, inManagedObjectContext: self.managedObjectContext!) as! Card

        card.frontText = frontText
        card.backText = backText
        card.deck = self
        return card;
    }
    
}