//
//  GameReviewController.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/02/06.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import UIKit

class GameReviewController: UIViewController
{
    
    //    this is a scroll view for the review of the game
        @IBOutlet weak var SrollResultView: UIScrollView!
    //    this is a view that shows the game trailer
        @IBOutlet weak var GametrailerView: UIView!
        
    //    this is to show the text for the actual game review in a dynamic way.
        @IBOutlet weak var GameReviewText: UITextView!
}
