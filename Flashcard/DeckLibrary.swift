//
//  DeckLibrary.swift
//  Flashcard
//
//  Created by Marko Seifert on 27.10.15.
//  Copyright © 2015 T-Systems. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String:AnyObject]

class DeckLibrary {
    
    var downloads = [DeckDownload]()
    
    func load() {
        let url = NSBundle.mainBundle().URLForResource("sets", withExtension: "json")!
        let data = NSData(contentsOfURL: url)!
        
        let jsonObject = try! NSJSONSerialization.JSONObjectWithData(data, options: [])
        handleJSON(jsonObject)
    
    }
        
    func handleJSON(jsonObject : AnyObject) {
        
        let json = jsonObject as! JSONDictionary
        let jsonSets = json["sets"] as! [AnyObject]

        
        self.downloads = []
        for jsonSet in jsonSets {
            self.downloads.append(DeckDownload(jsonObject: jsonSet))
        }
    }

}
