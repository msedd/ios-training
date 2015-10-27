//
//  DecksTableViewController.swift
//  Flashcard
//
//  Created by Marko Seifert on 27.10.15.
//  Copyright © 2015 T-Systems. All rights reserved.
//

import UIKit

class DecksTableViewController: UITableViewController {
    
    var decks : [Deck] = []

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return decks.count
    }
 
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        decks = flashcardsModel.decks
        self.tableView.reloadData()
    }
     override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("DeckCell",
            forIndexPath: indexPath)
        let deck = decks[indexPath.row]
        cell.textLabel?.text = deck.name
        return cell
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowDeck" {
        let cell = sender as! UITableViewCell
        let indexPath = self.tableView.indexPathForCell(cell)!
        let deck = decks[indexPath.row]
        let controller = segue.destinationViewController as! CardViewController
        controller.cards = deck.cardsToLearn
        }
    }

}
