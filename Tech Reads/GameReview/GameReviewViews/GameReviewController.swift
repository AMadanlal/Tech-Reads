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
  var searcheditem: String = "Bulletstorm"
  var gameplatform: String = "pc"

    override func viewDidLoad() {
        super.viewDidLoad()
     self.lblMain.text = "Loading..."
     self.gameReviewText.text = "Loading..."
    }
    override func viewDidAppear(_ animated: Bool) {
          displayAllInformation()
    }

  func displayAllInformation() {
   let gameDetail = ChickenCoopAPI(searched: searcheditem, platform: gameplatform)
         var gameInfo = gameDetail.gamedetails
         gameDetail.getGameInfo { result in
         switch result {
         case .failure(let error):
             print(error)
         case.success(let details):
             gameInfo = details
             print(details)
               DispatchQueue.main.async {
                 let displayClass = FormattingDisplayClass(gameM: gameInfo, lblTitle: self.lblMain,
                                                 txtView: self.gameReviewText, imgView: self.imageplace )
                 displayClass.todisplay()
             }
       }
   }
  }

    @IBAction func btnCancel(_ sender: UIButton) {
    }

override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  let randomGameClass = RandomGameReview()
  randomGameClass.getRandomGameFromList { (listItem) in
    DispatchQueue.main.async {
      print("Button Next Clicked")
        if segue.identifier == "reloadsegue" {
          let segueDest = segue.destination as? GameReviewController
          segueDest?.searcheditem = listItem.title
          segueDest?.gameplatform = listItem.platform
          segueDest?.displayAllInformation()
          print("\(listItem.title) + \(listItem.platform)")
         }
        }
       }
      }

    @IBAction func btnNext(_ sender: UIButton) {
       self.performSegue(withIdentifier: "reloadsegue", sender: self)
      }
}
