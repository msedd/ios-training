//
//  Deck+CoreDataProperties.swift
//  Flashcard
//
//  Created by Marko Seifert on 29.10.15.
//  Copyright © 2015 T-Systems. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Deck {

    @NSManaged var name: String?
    @NSManaged var cards: Set<Card>?

}
