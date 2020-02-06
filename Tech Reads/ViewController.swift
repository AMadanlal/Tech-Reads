//
//  ViewController.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/02/04.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainlabel.font=UIFont.italicSystemFont(ofSize: 100) //change the font of the main label
        mainlabel.numberOfLines = 2
        mainlabel.center.x = self.view.center.x

//    this is the source on how a divider is created: https://www.dev.com/how-to-draw-rectangle-view-use-swift-in-ios-app/
    }

//    this is a scroll view for the review of the game
    @IBOutlet weak var SrollResultView: UIScrollView!

    //    this is the app name label
    @IBOutlet weak var mainlabel: UILabel!
    
//    this is the searchbar
    @IBOutlet weak var SearchBar: UISearchBar!
    
//    this button is to change the user preferences
    @IBAction func PreferencesBtn(_ sender: Any){
    }
    
//    this button is to change what is shown to the user
    @IBAction func GenTEchReviewBtn(_ sender: Any) {
    }
    
//    this button is to change what is shown to the user
    @IBAction func GenGameReviewBtn(_ sender: Any) {
    }
    
//    this is a view that shows the game trailer
    @IBOutlet weak var GametrailerView: UIView!
    
//    this is to show the text for the actual game review in a dynamic way.
    @IBOutlet weak var GameReviewText: UITextView!
}

