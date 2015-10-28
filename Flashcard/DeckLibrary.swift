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
        super.init(bundleFilename: "sets")
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
