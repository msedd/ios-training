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
    
    var downloads = [JSONDictionary]()
    
    func load() {
        let url = NSBundle.mainBundle().URLForResource("sets", withExtension: "json")!
        let data = NSData(contentsOfURL: url)!
        let jsonObject = try! NSJSONSerialization.JSONObjectWithData(data, options: [])
        
        let json = jsonObject as! JSONDictionary
        self.downloads = json["sets"] as! [JSONDictionary]
    
    }

}
