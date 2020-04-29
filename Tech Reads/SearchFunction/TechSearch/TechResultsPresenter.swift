//
//  TechResultsPresenter.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/04/18.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import Foundation
import TechReadsPod

class TechResultsPresenter {
  weak var view: TechResultsPresenterView?
  var newsArticles: NewsSource?
  var techNewsItems = [String]()

  init(with view: TechResultsPresenterView) { self.view = view }

  func displayTechResults() {
    let newsApi = NewsAPICalls()
    newsApi.getCustomNewsList(searchitem: view?.searchString ?? "") { result in
    switch result {
    case .failure(let error):
      print(error)
    case.success(let details):
      self.newsArticles = details
      self.techNewsItems = details.articles.map { item in
        let title = item.title
        return title
      }
      DispatchQueue.main.async {
        self.view?.updateSearchItems(newsItems: self.techNewsItems)
        }
      }
    }
  }

}
