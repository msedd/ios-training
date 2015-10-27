//
//  DecksTableViewController.swift
//  Flashcard
//
//  Created by Marko Seifert on 27.10.15.
//  Copyright © 2015 T-Systems. All rights reserved.
//

import UIKit

class DecksTableViewController: UITableViewController {
    
    let decks = flashcardsModel.decks

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return decks.count
    }
 
     override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("DeckCell",
            forIndexPath: indexPath)
        let deck = decks[indexPath.row]
        cell.textLabel?.text = deck.name
        return cell
    }

}
