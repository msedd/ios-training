//
//  DeckDownload.swift
//  Flashcard
//
//  Created by Marko Seifert on 27.10.15.
//  Copyright © 2015 T-Systems. All rights reserved.
//

import Foundation


protocol DeckDownloadProtocol{
    
    func downloadFinished(download : DeckDownload)
    
}

class DeckDownload :JSONResource{
    let id:Int
    let title : String
    
    var delegate : DeckDownloadProtocol?

    
    init(jsonObject : AnyObject) {
        let json = jsonObject as! JSONDictionary
        self.id = json["id"] as! Int
        self.title = json["title"] as! String
        super.init(bundleFilename: String(self.id))
    }
    override func handleJSON(jsonObject: AnyObject) {
        let json = jsonObject as! JSONDictionary
        let jsonCards = json["terms"] as! [JSONDictionary]
        let deck = flashcardsModel.createDeck(self.title)
        
        for jsonCard in jsonCards {
            let front = jsonCard["term"] as! String
            let back = jsonCard["definition"] as! String
            deck.createCard(front, backText: back)
        }
        delegate?.downloadFinished(self)
    }
}