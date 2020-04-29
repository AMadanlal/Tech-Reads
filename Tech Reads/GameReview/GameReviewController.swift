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

  @IBOutlet weak var lblMain: UILabel!
  @IBOutlet weak var gameReviewText: UITextView!
  @IBOutlet weak var imagePlace: UIImageView!
   @IBOutlet weak var textView: UIView!
  @IBOutlet weak var btnNextOutlet: UIButton!
  lazy var gamePresenter = GameReviewPresenter(with: self)
  public var isSearched = false

    override func viewDidLoad() {
      super.viewDidLoad()
      if isSearched == false {
        gamePresenter.displayRandomGame()
      } else {
        gamePresenter.displayGame()
      }
      setupViewBorders()
    }

  func setupViewBorders() {
    setTextViewBorder(field: textView)
    setButtonBorder(button: btnNextOutlet)
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    setupViewBorders()
  }

    @IBAction func btnCancel(_ sender: UIButton) {

  }

    @IBAction func btnNext(_ sender: UIButton) {
      gamePresenter.displayRandomGame()
  }

  func updatePageContent(_ title: String, withContent content: String, andImageURL imageUrl: String) {
    lblMain.text = title
    gameReviewText.text = content
    imagePlace.image(fromUrl: imageUrl)
  }

}
