//
//  TechResultsPresenter.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/04/18.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import Foundation
import TechReadsPod

protocol TechResultsPresenterView: class {
  func getSearchString() -> String
  func updateSearchItems(newsItems: [String])
  func reloadTable()
}

class TechResultsPresenter {
  weak var view: TechResultsPresenterView?
  var newsArticles: NewsSource?
  var techNewsItems = [String]()

  init(with view: TechResultsPresenterView) { self.view = view }

  func displayTechResults() {
    let newsApi = NewsAPICalls()
    newsApi.getCustomNewsList(searchitem: view?.getSearchString() ?? "") { result in
    switch result {
    case .failure(let error):
      print(error)
    case.success(let details):
      self.newsArticles = details
      for item in details.articles {
        let title = item.title ?? "Unknown Title"
        let description = item.description ?? "Unknown"
        self.techNewsItems.append(title + " /n " + description)
      }
      DispatchQueue.main.async {
        self.view?.updateSearchItems(newsItems: self.techNewsItems)
        self.view?.reloadTable()
        }
      }
    }
  }

}
