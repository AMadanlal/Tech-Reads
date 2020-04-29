//
//  Presenter.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/04/17.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import Foundation
import TechReadsPod

class TechNewsPresenter {

  weak var view: TechNewsPresenterView?
  var newsArticles: NewsSource?
  var newsArticle: NewsSource.Article?

  init(with view: TechNewsPresenterView) { self.view = view }

  func getSourceURLString() -> String { return newsArticle?.url?.absoluteString ?? "www.google.com"}

  func displayTechNews() {
    let newsApi = NewsAPICalls()
    guard let newsArticle = self.newsArticle else { return }
    newsApi.getArticleTextFormat(theArticle: newsArticle) { result in
    DispatchQueue.main.async {
      self.view?.updatePageContent(title: self.newsArticle?.title ?? "Unknown Title",
                                content: result,
                                imageUrl: self.newsArticle?.urlToImage?.absoluteString ?? "")
      }
    }
  }

  func displayRandomTechNews() {
    let newsApi = NewsAPICalls()
    newsApi.getNewsList { result in
    switch result {
    case .failure(let error):
    print(error)
    DispatchQueue.main.async {
      self.view?.popUpWarning(title: "Error", message: "Data couldnt be obtained")
      }
    case.success(let details):
    self.newsArticles = details
    self.newsArticle = newsApi.getRandomArticle(allArticles: details)
    DispatchQueue.main.async {
      guard let newsArticle = self.newsArticle else { return }
      newsApi.getArticleTextFormat(theArticle: newsArticle) { result in
        DispatchQueue.main.async {
          self.view?.updatePageContent(title: self.newsArticle?.title ?? "Unknown Title",
                                       content: result,
                                       imageUrl: self.newsArticle?.urlToImage?.absoluteString ?? "")
        }
      }
    }
    }
    }
  }
}
