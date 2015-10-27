//
//  AddDecksTableViewController.swift
//  Flashcard
//
//  Created by Marko Seifert on 27.10.15.
//  Copyright © 2015 T-Systems. All rights reserved.
//

import UIKit

class AddDecksTableViewController: UITableViewController {


    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        switch(indexPath.row) {
        case 0:
        flashcardsModel.createEnglishDeck()
        case 1:
        flashcardsModel.createRussionDeck()
        default:
        return
        }
         self.navigationController?.popViewControllerAnimated(true)
        //flashcardsModel.logModel()
    }

}
