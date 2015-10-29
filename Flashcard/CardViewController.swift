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
        updateView()

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
        
        let now = NSDate()
        self.card?.answeredCorrect(true, date: now)
        showNextCard()
        
    }
    
    
    @IBAction func wrong(sender: AnyObject) {
        let now = NSDate()
        self.card?.answeredCorrect(false, date: now)
        showNextCard()
    }
    
    func showNextCard() {
        if let card = self.card, let index = cards.indexOf(card)?.successor() where cards.indices.contains(index) {
        // Nächste Lernkarte:
            self.card = cards[index]
            self.flipped = false
            updateView();
        }
        else{
        // Letzte Lernkarte:
        // ViewController vom Navigations-Stapel entfernen 
        self.navigationController?.popViewControllerAnimated(true)
        }
    }
    
    private func updateView() {
        if self.isViewLoaded(){
            updateViewText()
            updateViewButtons()
            updateViewNavTitle()
        }
    }
    private func updateViewText() {

        //cardView.text = flipped ? card?.backText : card?.frontText
        
        UIView.transitionWithView(self.cardView, duration: 0.5, options: .TransitionFlipFromTop,
        animations: {
            self.cardView.text = self.flipped ? self.card?.backText : self.card?.frontText
        },
        completion:nil)
    }
    private func updateViewNavTitle() {
        if let card = self.card, let index = cards.indexOf(card) {
        var title = NSLocalizedString("CardTitle", value:"{index} of {count}",
        comment:"Placeholders {index}, {count}")
        title = title.stringByReplacingOccurrencesOfString("{index}",
        withString: String(index + 1))
        title = title.stringByReplacingOccurrencesOfString("{count}",
        withString: String(cards.count))
        self.navigationItem.title = title
        }
    }
    private func updateViewButtons() {
        
        // Ursprüngliche Position der Buttons sichern
        let posWrong = buttonWrong.center
        let posCorrect = buttonCorrect.center
        // Falsch/Richtig Button in die Mitte über den Flip-Button positionieren...
        buttonCorrect.center = buttonFlip.center
        buttonWrong.center = buttonFlip.center
        
        
        UIView.animateWithDuration(0.2, animations: {
            // move the buttons back
            self.buttonWrong.center = posWrong
            self.buttonCorrect.center = posCorrect
        })
                
                buttonWrong.hidden = !flipped
                buttonFlip.hidden = flipped
                buttonCorrect.hidden = !flipped
       
    }

}
