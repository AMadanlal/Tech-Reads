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
        mainlabel.font=UIFont.italicSystemFont(ofSize: 50) //change the font of the main label

        //    this is the source on how the following divider was created: https://www.dev.com/how-to-draw-rectangle-view-use-swift-in-ios-app/
        
//        the following is the starting co-ordinates of the rectangle/divider
        let xcoordinate = 20
        let ycoordinate = 285
//        the sizes of the rectangle/divider
        let rectanglewidth = 374
        let rectangleheight = 1
        
//        now creating the object used to render the rectangle/divider
        let divider : CGRect = CGRect(x : CGFloat(xcoordinate), y : CGFloat(ycoordinate), width : CGFloat(rectanglewidth), height: CGFloat(rectangleheight))
        let dividerview=UIView(frame: divider)
        dividerview.backgroundColor = UIColor.systemGray
        self.view.addSubview(dividerview)
        
    }

    @IBOutlet weak var ResultView: UIView!
    
    @IBOutlet weak var mainlabel: UILabel!
    
    @IBOutlet weak var SearchBar: UISearchBar!
    
    @IBAction func PreferencesBtn(_ sender: Any){
    }
    
    @IBAction func GenTEchReviewBtn(_ sender: Any) {
    }
    
    @IBAction func GenGameReviewBtn(_ sender: Any) {
    }
    
}

