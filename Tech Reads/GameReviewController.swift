//
//  GameReviewController.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/02/06.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import UIKit

class GameReviewController: UIViewController {
  //    this is a scroll view for the review of the game
      @IBOutlet weak var srollResultView: UIScrollView!
  //    this is a view that shows the game trailer
      @IBOutlet weak var gametrailerView: UIView!
  //    this is to show the text for the actual game review in a dynamic way.
      @IBOutlet weak var gameReviewText: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func btnCancel(_ sender: UIButton) {
    }
//    this button is for going to the next suggested game and should only be visible
//    if the user clicked on general game reviews.
    @IBAction func btnNext(_ sender: UIButton) {
    }
}
