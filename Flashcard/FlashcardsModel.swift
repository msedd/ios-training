//
//  FlashcardsModel.swift
//  Flashcard
//
//  Created by Marko Seifert on 26.10.15.
//  Copyright © 2015 T-Systems. All rights reserved.
//

import Foundation
import CoreData

class FlashcardsModel : NSObject{
    
    var decks : [Deck] {
        let request = NSFetchRequest (entityName: Deck.EntityName)
        request.sortDescriptors = [ NSSortDescriptor(key: "name", ascending: true)]
        return try! managedObjectContext.executeFetchRequest(request) as! [Deck]
    }
    private let managedObjectContext : NSManagedObjectContext
    
    
    init(managedObjectContext : NSManagedObjectContext){
        self.managedObjectContext = managedObjectContext
         super.init()
    }
    
    func createDeck(name : String) -> Deck {
        let deck = NSEntityDescription.insertNewObjectForEntityForName(Deck.EntityName, inManagedObjectContext: self.managedObjectContext) as! Deck
        deck.name = name;
        return deck
    }
    
    func createEnglishDeck() -> Deck{
    
        let deck = createDeck( NSLocalizedString("EnglishGerman", value:"English ↔ German", comment: "Deck Name") )
        deck.createCard("bird", backText: "Vogel")
        deck.createCard("tree", backText: "Baum")
        deck.createCard("house", backText: "Haus")
        save()
        return deck
    }
    func createRussionDeck() -> Deck{
        let deck = createDeck( NSLocalizedString("RussianGerman", value:"Russian ↔ German", comment: "Deck Name"))
        deck.createCard("Спасибо", backText: "Danke")
        deck.createCard("А у тебя?", backText: "Und dir")
        deck.createCard("Тоже", backText: "auch")
        deck.createCard("Как дела?",backText:"Wie geht’s")
        deck.createCard("Здравствуйте!", backText: "formeller Gruß")
        save()        
        return deck

    }
    func save(){
        do{
            try managedObjectContext.save()
        }
        catch let error as NSError{
            NSLog("Error saving: %@", error)
        }
    }
}


private let coreData = try! CoreData(sqliteDocumentName: "Flashcards.db", schemaName: "Flashcards")
let flashcardsModel = FlashcardsModel(managedObjectContext: coreData.createManagedObjectContext());
