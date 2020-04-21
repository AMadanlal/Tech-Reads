//
//  GameReviewController.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/02/06.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import UIKit
import TechReadsPod

class GameReviewController: UIViewController, GamePresenterView {

//  this is the main game label 
  @IBOutlet weak var lblMain: UILabel!
  @IBOutlet weak var gameReviewText: UITextView!
  @IBOutlet weak var imageplace: UIImageView!
  lazy var gamePresenter = GameReviewPresenter(with: self)
  public var isSearched = false

    override func viewDidLoad() {
      super.viewDidLoad()
      if isSearched == false {
        gamePresenter.displayRandomGame()
      } else {
        gamePresenter.displayGame()
      }
    }

//    override func viewDidAppear(_ animated: Bool) {
//          displayAllInformation()
//    }
//  func displayAllInformation() {
//  normally had the info
//  }

    @IBAction func btnCancel(_ sender: UIButton) {

  }

    @IBAction func btnNext(_ sender: UIButton) {
      gamePresenter.displayRandomGame()
  }

  func updatePageContent(_ title: String, withContent content: String, andImageURL imageUrl: String) {
    lblMain.text = title
    gameReviewText.text = content
    imageplace.image(fromUrl: imageUrl)
  }

}
