//
//  ViewController.swift
//  playingCard
//
//  Created by Echo Wang on 7/30/19.
//  Copyright © 2019 Echo Wang Studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var deck = PlayingCardDeck()
       
    @IBOutlet weak var playingCardView: PlayingCardView!{
        didSet{
            // swipe changes the model, the action wrote in controller
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(nextCard))
            swipe.direction = [.left, .right]
            playingCardView.addGestureRecognizer(swipe)
            // pinch only changes the view, the action wrote in view 
            let pinch = UIPinchGestureRecognizer(target: playingCardView, action: #selector(playingCardView.adjustFaceCardScale(byHandlingGestureRecognizedBy:)))
            playingCardView.addGestureRecognizer(pinch)
        }
    }
    
    // the mechanism(target and action) is built on oc, so @objc
    @ objc func nextCard(){
        if let card = deck.draw(){
            playingCardView.rank = card.rank.order
            playingCardView.suit = card.suit.rawValue
        }
    }
    
    // add tap gesture in storyboard
    @IBAction func flipCard(_ sender: UITapGestureRecognizer) {
        switch sender.state {
        case .ended:
            playingCardView.isFaceUp = !playingCardView.isFaceUp
        default:
            break
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /*
        for _ in 1...10{
            if let card = deck.draw(){
                print("\(card)")
            }
        }
        */
        var cards = [PlayingCard]()
    }
    

}

