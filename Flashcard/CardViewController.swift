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
    
    var card: Card?{
        didSet {
            updateView()
        }
    }
    var cards: [Card]=[]{
        didSet{
            self.card = cards.first
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func flip() {
        self.flipped = !self.flipped
        self.updateView()
    }
    
    @IBAction func correct(sender: AnyObject) {
        showNextCard()
    }
    
    
    @IBAction func wrong(sender: AnyObject) {
        showNextCard()
    }
    
    func showNextCard() {
        if let card = self.card, let index = cards.indexOf(card)?.successor() where cards.indices.contains(index) {
        // Nächste Lernkarte:
            self.card = cards[index]
            self.flipped = false
            updateView();
        }
    }
    
    private func updateView() {
        if self.isViewLoaded(){
            updateViewText()
            updateViewButtons()
        }
    }
    private func updateViewText() {

        cardView.text = flipped ? card?.backText : card?.frontText
    }
    private func updateViewButtons() {
        buttonWrong.hidden = !flipped
        buttonFlip.hidden = flipped
        buttonCorrect.hidden = !flipped
       
    }

}
