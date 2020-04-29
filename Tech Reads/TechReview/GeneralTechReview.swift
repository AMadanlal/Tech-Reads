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
  @IBOutlet weak var btnNextOutlet: UIButton!
  lazy var newsPresenter = TechNewsPresenter(with: self)
  public var isSearched = false
  @IBOutlet weak var btnSourceOutlet: UIButton!

  @IBOutlet weak var techView: UIView!
  @IBAction func btnBack(_ sender: Any) {
  }

  override func viewDidLoad() {
        super.viewDidLoad()
      if isSearched == false {
        newsPresenter.displayRandomTechNews()
      } else {
        newsPresenter.displayTechNews()
      }
    setUpUI()
    }

  func setUpUI() {
    setStandardTextViewBorder(field: txtNewsDetails)
    setStandardButtonBorder(button: btnSourceOutlet)
    setProperSpacing(in: btnSourceOutlet, imageInsertLeft: 0, titleInsertLeft: -20)
    setStandardButtonBorder(button: btnNextOutlet)
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    setUpUI()
  }
  override func viewDidAppear(_ animated: Bool) {
    setUpUI()
  }

  @IBAction func btnSource(_ sender: UIButton) {
    performSegue(withIdentifier: "sourceLink", sender: self)
  }

  @IBAction func btnNext(_ sender: UIButton) {
    newsPresenter.displayRandomTechNews()
  }

  func updatePageContent(title: String, content: String, imageUrl: String) {
    titleLabel.text = title
    txtNewsDetails.text = content
    imgView.image(fromUrl: imageUrl)
  }

  func popUpWarning(title: String, message: String) {
    let alert = alertPopupBox(title: title, message: message)
    self.present(alert, animated: true, completion: nil)
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if segue.identifier == "sourceLink" {
      let segueDest = segue.destination as? WebView
      segueDest?.urlString = newsPresenter.getSourceURLString()
       }
   }

}
