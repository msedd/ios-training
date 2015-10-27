//
//  CardViewController.swift
//  Flashcard
//
//  Created by Marko Seifert on 26.10.15.
//  Copyright © 2015 T-Systems. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

    @IBOutlet var buttonWrong: UIButton!
    @IBOutlet var buttonFlip: UIButton!
    @IBOutlet var buttonCorrect: UIButton!
    @IBOutlet var cardView: UITextView!
    
    private var flipped : Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func flip() {
        self.flipped = !self.flipped
        self.updateView()
    }
    private func updateView() {
        updateViewText()
        updateViewButtons()
    }
    private func updateViewText() {
        if flipped {
        cardView.text = "Rückseite" }else{
        cardView.text = "Vorderseite"
        }
    }
    private func updateViewButtons() {
        buttonWrong.hidden = !flipped
        buttonFlip.hidden = flipped
        buttonCorrect.hidden = !flipped
       
    }

}
