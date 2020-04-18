//
//  GeneralTechReview.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/02/06.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import UIKit

class GeneralTechReview: UIViewController, TechNewsPresenterView {
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var txtNewsDetails: UITextView!
  @IBOutlet weak var imgView: UIImageView!
  lazy var newsPresenter = TechNewsPresenter(with: self)
  public var articleStatus = false

    override func viewDidLoad() {
        super.viewDidLoad()
      if articleStatus == false {
        newsPresenter.displayRandomTechNews()
      } else {
        newsPresenter.displayTechNews()
      }
    }

  @IBAction func btnBack(_ sender: UIButton) {
  }

  @IBAction func btnNext(_ sender: UIButton) {
    newsPresenter.displayRandomTechNews()
  }

  func updateTitle(text: String) {
    titleLabel.text = text
  }

  func updateImage(image: UIImage) {
    imgView.image = image
  }

  func updateTextfield(text: String) {
    txtNewsDetails.text = text
  }

}
