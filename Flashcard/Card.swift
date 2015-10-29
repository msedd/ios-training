//
//  Card.swift
//  Flashcard
//
//  Created by Marko Seifert on 26.10.15.
//  Copyright © 2015 T-Systems. All rights reserved.
//

import Foundation
import CoreData
import NSDate_Extensions_iOS7

class Card : NSManagedObject{

    static let EntityName = "Card"
    
    func answeredCorrect(correct : Bool, date : NSDate) {
        self.scheduleDate = correct ? date.dateByAddingDays(1) : date.dateByAddingHours(1)
    }
    
}