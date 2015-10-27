//
//  DeckDownload.swift
//  Flashcard
//
//  Created by Marko Seifert on 27.10.15.
//  Copyright © 2015 T-Systems. All rights reserved.
//

import Foundation

class DeckDownload {
    let id:Int
    let title : String

    init(jsonObject : AnyObject) {
        let json = jsonObject as! JSONDictionary
        self.id = json["id"] as! Int
        self.title = json["title"] as! String
    }
}