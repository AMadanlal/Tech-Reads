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
 /*   func todisplay(gamemodel: Game) {
      self.lblMain.text = gamemodel.title
  //this part formats the different string arrays better
      var simplifiedgenrestring = ""
      for gen in gamemodel.genre {
        if gen == gamemodel.genre[gamemodel.genre.count-1] {
            simplifiedgenrestring += gen
          } else {
            simplifiedgenrestring += gen + ", "
          }
        }
      var simplifiedpublisherstring = ""
      for pub in gamemodel.publisher {
      if pub == gamemodel.publisher[gamemodel.publisher.count-1] {
          simplifiedpublisherstring += pub
        } else {
          simplifiedpublisherstring += pub + ", "
        }
      }
      var simplifiedconsolestring = ""
      for console in gamemodel.alsoAvailableOn {
      if console == gamemodel.alsoAvailableOn[gamemodel.alsoAvailableOn.count-1] {
          simplifiedconsolestring += console
        } else {
          simplifiedconsolestring += console + ", "
        }
      }
  //the next string contains the content to be shown to the user in a specific format
      let fulltext = """
      Release Date: \(gamemodel.releaseDate)
      Genres: \(simplifiedgenrestring)
      Developer: \(gamemodel.developer)
      Publisher: \(simplifiedpublisherstring)
      Also Available on: \(simplifiedconsolestring)
      Rating: \(gamemodel.rating)
      Description: \(gamemodel.description)
      Score: \(gamemodel.score)
      """
  //    this is to load the image onto the page
      guard let imageURL = URL(string: gamemodel.image) else { return }
      DispatchQueue.global().async {
          guard let imageData = try? Data(contentsOf: imageURL) else { return }
          let image = UIImage(data: imageData)
          DispatchQueue.main.async {
              self.imageplace.image = image
          }
      }
      self.gameReviewText.text = fulltext
    }*/
    @IBAction func btnCancel(_ sender: UIButton) {
    }
    @IBAction func btnNext(_ sender: UIButton) {
    }
}
