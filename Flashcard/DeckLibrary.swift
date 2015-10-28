//
//  DeckLibrary.swift
//  Flashcard
//
//  Created by Marko Seifert on 27.10.15.
//  Copyright © 2015 T-Systems. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String:AnyObject]


class DeckLibrary : JSONResource{
    
    var downloads = [DeckDownload]()
    
    init() {
        //super.init(bundleFilename: "sets")
        //super.init (url: NSURL(string: "https://www.ralfebert.de/flashcards/sets.json")!)
        //super.init (url: NSURL(string: "https://api.quizlet.com/2.0/sets/101405328?client_id=CehJeM3ejY")!)
        super.init (url: NSURL(string: "https://api.quizlet.com/2.0/search/sets?client_id=CehJeM3ejY&q=%D0%BF%D0%BE-%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%B8")!)

    }
    
    override func handleJSON(jsonObject: AnyObject) {
            
        let json = jsonObject as! JSONDictionary
        let jsonSets = json["sets"] as! [AnyObject]

        /*
        self.downloads = []
        for jsonSet in jsonSets {
            self.downloads.append(DeckDownload(jsonObject: jsonSet))
        }
        */
        // neue Schreibweise in Swift2 
        // init-Methode als Funktion reinreichen 
        self.downloads = jsonSets.map(DeckDownload.init);
    }


}
