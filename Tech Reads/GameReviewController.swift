//
//  GameReviewController.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/02/06.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import UIKit
import TechReadsPod

class GameReviewController: UIViewController {
//  this is the main game label
  @IBOutlet weak var lblMain: UILabel!
  //    this is a scroll view for the review of the game
      @IBOutlet weak var srollResultView: UIScrollView!
  //    this is a view that shows the game trailer
      @IBOutlet weak var gametrailerView: UIView!
  //    this is to show the text for the actual game review in a dynamic way.
  @IBOutlet weak var gameReviewText: UITextView!
//  this is the place where to put the image
  @IBOutlet weak var imageplace: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
     self.lblMain.text = "Loading..."
     self.gameReviewText.text = "Loading..."
    }
    override func viewDidAppear(_ animated: Bool) {
              let gamedetail = ChickenCoopAPI(searched: "Bulletstorm")
              var gameinfo = gamedetail.gamedetails
              gamedetail.getGameInfo { result in
              switch result {
              case .failure(let error):
                  print(error)
              case.success(let details):
                  gameinfo = details
                  print(details)
                    DispatchQueue.main.async {
                    todisplay(gamemodel: gameinfo, titlelabel: self.lblMain,
                              textview: self.gameReviewText, imageplace: self.imageplace)
                  }
            }
        }
    }
    @IBAction func btnCancel(_ sender: UIButton) {
    }
    @IBAction func btnNext(_ sender: UIButton) {
    }
}
