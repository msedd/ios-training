//
//  DeckDownload.swift
//  Flashcard
//
//  Created by Marko Seifert on 27.10.15.
//  Copyright © 2015 T-Systems. All rights reserved.
//

import Foundation


protocol DeckDownloadProtocol : class{
    
    func downloadFinished(download : DeckDownload)
    
}

class DeckDownload :JSONResource{
    let id:Int
    let title : String
    
    weak  var delegate : DeckDownloadProtocol?

    
    init(jsonObject : AnyObject) {
        let json = jsonObject as! JSONDictionary
        self.id = json["id"] as! Int
        self.title = json["title"] as! String
        //super.init(bundleFilename: String(self.id))
        //super.init (url: NSURL(string: "https://www.ralfebert.de/flashcards/\(self.id).json")!)
        
        
        // TODO Refactor to NSURLComponents
        super.init (url: NSURL(string: "https://api.quizlet.com/2.0/sets/\(self.id)?client_id=CehJeM3ejY")!)
                
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
        flashcardsModel.save()
        delegate?.downloadFinished(self)
    }
}