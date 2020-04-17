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

  init(with view: TechNewsPresenterView) { self.view = view }

  func displayTechNews() {
    let newsApi = NewsAPICalls()
    newsApi.getNewsList { result in
    switch result {
    case .failure(let error):
      print(error)
    case.success(let details):
      self.newsArticles = details
      let randomArticle = newsApi.getRandomArticle(allArticles: details)
      DispatchQueue.main.async {
        self.view?.updateTitle(text: randomArticle.title ?? "Unknown Title")
        newsApi.getArticleTextFormat(theArticle: randomArticle) { result in
          DispatchQueue.main.async {
          self.view?.updateTextfield(text: result)
            }
          }
            //    self.view?.updateImage()
        }
      }
    }
  }
}
