//
//  FlashcardTests.swift
//  FlashcardTests
//
//  Created by Marko Seifert on 26.10.15.
//  Copyright © 2015 T-Systems. All rights reserved.
//

import XCTest
@testable import Flashcard

class FlashcardTests: XCTestCase {
    
    var db : CoreData!
    var model : FlashcardsModel!
    var deck : Deck!
    var card : Card!
    
    override func setUp() {
        db = try! CoreData(inMemorySchemaName:"Flashcards")
        model = FlashcardsModel(managedObjectContext:db.createManagedObjectContext())
        deck = model.createEnglishDeck()
        card = deck.cards!.first
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testIncorrectScheduled1HourLater() {
        card.answeredCorrect(false, date:dateFromString("2015-01-05 15:00"))
        XCTAssertEqual(card.scheduleDate!, dateFromString("2015-01-05 16:00"), "scheduleDate +1h")
    }
    
    func dateFromString(str : String) -> NSDate {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        return dateFormatter.dateFromString(str)!
    }
    
}
