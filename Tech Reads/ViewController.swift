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

    //    this is the app name label
    @IBOutlet weak var mainlabel: UILabel!
   
//    this button takes the user to the search page
    @IBAction func SearchButton(_ sender: Any) {
    }
    
//    this button is to go to the preferences page
    @IBAction func PreferencesBtn(_ sender: Any){
    }
    
//    this button is to take the user to the general tech review page
    @IBAction func GenTEchReviewBtn(_ sender: Any) {
    }
    
//    this button takes the user to the general game review pages
    @IBAction func GenGameReviewBtn(_ sender: Any) {
    }
    
}
