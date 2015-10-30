//
//  DeckLibraryTableViewController.swift
//  Flashcard
//
//  Created by Marko Seifert on 27.10.15.
//  Copyright © 2015 T-Systems. All rights reserved.
//

import UIKit
import MBProgressHUD


class DeckLibraryTableViewController: UITableViewController, DeckDownloadProtocol {
    
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
        cell.textLabel?.text = download.title
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        let download = self.deckLibrary.downloads[indexPath.row]
        download.delegate = self
        download.load()
    }

    func updateView() {
        self.deckLibrary.load {[weak self] in
            NSOperationQueue.mainQueue().addOperationWithBlock {
                self?.tableView.reloadData()
            }
            NSLog("Deck Library loaded!")
        }
    }

    // MARK: - DeckDownloadDelegate
    
    func downloadFinished(download: DeckDownload) {
        //NSThread.sleepForTimeInterval(5);
        NSOperationQueue.mainQueue().addOperationWithBlock({
            self.navigationController?.popToRootViewControllerAnimated(true)
            MBProgressHUD.hideHUDForView(self.view, animated: true)
        })
        
    }
    deinit{
        print ("RIP \(self.dynamicType)")
    }
}
