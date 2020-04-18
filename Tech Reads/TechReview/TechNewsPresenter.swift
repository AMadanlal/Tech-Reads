//
//  Presenter.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/04/17.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import Foundation
import TechReadsPod

protocol TechNewsPresenterView: class {
  func updateTextfield(text: String)
  func updateTitle(text: String)
  func updateImage(image: UIImage)
}

class TechNewsPresenter {

  weak var view: TechNewsPresenterView?
  var newsArticles: NewsSource?
  var newsArticle: NewsSource.Article?

  init(with view: TechNewsPresenterView) { self.view = view }

  func loadimage(imageUrl: String, completionHandler: @escaping(UIImage) -> Void) {
     guard let imageURL = URL(string: imageUrl) else { return }
     DispatchQueue.global().async {
        guard let imageData = try? Data(contentsOf: imageURL) else { return }
        let image = UIImage(data: imageData)
        completionHandler(image!)
     }
   }

  func displayTechNews() {
    let newsApi = NewsAPICalls()
    view?.updateTitle(text: self.newsArticle?.title ?? "Unknown Title")
    newsApi.getArticleTextFormat(theArticle: (self.newsArticle!)) { result in
    DispatchQueue.main.async {
    self.view?.updateTextfield(text: result)
      self.loadimage(imageUrl: self.newsArticle?.urlToImage?.absoluteString ?? "") { result in
          DispatchQueue.main.async {
            self.view?.updateImage(image: result)
          }
        }
      }
    }
  }

  func displayRandomTechNews() {
    let newsApi = NewsAPICalls()
    newsApi.getNewsList { result in
    switch result {
    case .failure(let error):
      print(error)
    case.success(let details):
      self.newsArticles = details
      self.newsArticle = newsApi.getRandomArticle(allArticles: details)
      DispatchQueue.main.async {
        self.view?.updateTitle(text: self.newsArticle?.title ?? "Unknown Title")
        newsApi.getArticleTextFormat(theArticle: (self.newsArticle!)) { result in
          DispatchQueue.main.async {
          self.view?.updateTextfield(text: result)
            self.loadimage(imageUrl: self.newsArticle?.urlToImage?.absoluteString ?? "") { result in
                DispatchQueue.main.async {
                self.view?.updateImage(image: result)
                }
              }
            }
          }
        }
      }
    }
  }
}
