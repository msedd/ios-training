//
//  DeckLibraryTableViewController.swift
//  Flashcard
//
//  Created by Marko Seifert on 27.10.15.
//  Copyright © 2015 T-Systems. All rights reserved.
//

import UIKit



class DeckLibraryTableViewController: UITableViewController {
    
    let deckLibrary = DeckLibrary()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.updateView()
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.deckLibrary.downloads.count
    }
    
    override func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("DeckDownloadCell" , forIndexPath: indexPath)
        let download = self.deckLibrary.downloads[indexPath.row]
        cell.textLabel?.text = download["title"] as? String
        return cell
    }

    func updateView() {
        self.deckLibrary.load()
    

    }
}
