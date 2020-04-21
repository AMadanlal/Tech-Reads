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
  public var isSearched = false

    override func viewDidLoad() {
        super.viewDidLoad()
      if isSearched == false {
        newsPresenter.displayRandomTechNews()
      } else {
        newsPresenter.displayTechNews()
      }
    }

  @IBAction func btnBack(_ sender: UIButton) {
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

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if segue.identifier == "sourceLink" {
      let segueDest = segue.destination as? WebView
      segueDest?.urlString = newsPresenter.getSourceURLString()
       }
   }

}

extension UIImageView {
  public func image(fromUrl urlString: String) {
    guard let url = URL(string: urlString) else {
      print("Could not get Image")
      return
    }
    let theTask = URLSession.shared.dataTask(with: url) { data, response, _ in
      if let response = data {
        DispatchQueue.main.async {
          self.image = UIImage(data: response)
        }
      }
    }
    theTask.resume()
  }
}
