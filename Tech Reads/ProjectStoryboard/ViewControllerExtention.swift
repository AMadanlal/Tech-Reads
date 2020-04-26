//
//  ViewControllerExtention.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/04/25.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import UIKit
import QuartzCore
import TechReadsPod
import WatchConnectivity

// WCSession delegate functions
extension ViewController: WCSessionDelegate {
  func sessionDidBecomeInactive(_ session: WCSession) {
  }

  func sessionDidDeactivate(_ session: WCSession) {
  }

  func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState,
               error: Error?) {
  }

  func sendItems(article: NewsSource.Article) {
    let articleTitleToSend: [String: Any] = ["title": article.title ]
    let articleImageToSend: [String: Any] = ["imageUrl": article.urlToImage?.absoluteString ?? "No imageURL"]
    if let validSession = self.session, validSession.isReachable {
      validSession.sendMessage(articleTitleToSend, replyHandler: nil, errorHandler: nil)
      validSession.sendMessage(articleImageToSend, replyHandler: nil, errorHandler: nil)
    }
  }

  func sendRandomArticleItem() {
    let randomNewArticle = self.newsList?.articles.randomElement()
    guard let val = randomNewArticle else { return }
      self.sendItems(article: val)
  }

  func sendArticleItem() {
    NewsAPICalls().getNewsList { result in
      switch result {
      case .failure(let error):
        print(error)
      case.success(let details):
        self.newsList = details
        let article: NewsSource.Article? = self.newsList?.articles.first
        guard let val = article else { return }
        DispatchQueue.main.async {
          self.sendItems(article: val)
        }
      }
    }
  }

  func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
    print("received message: \(message)")
    DispatchQueue.main.async {
      if (message["NewData"] as? String) != nil {
        print("SENDING ARTICLE TO WATCH")
        self.sendArticleItem()
      } else if (message["RandomData"] as? String) != nil {
        print("SENDING ARTICLE TO WATCH")
        self.sendRandomArticleItem()
      } else if (message["ArticleTitle"] as? String) != nil {
        print("going into tech news")
        guard let articles = self.newsList?.articles else { return }
        var index = 0
        var indexOfItem = 0
        for article in articles {
          let value = message["ArticleTitle"] as? String
          if article.title == value {
            indexOfItem = index
          }
          index += 1
        }
        self.articleToUse = self.newsList?.articles[indexOfItem]
        self.performSegue(withIdentifier: "WatchSegue", sender: self)
      }
    }
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "WatchSegue" {
      let segueDest = segue.destination as? GeneralTechReview
      segueDest?.isSearched = true
      segueDest?.newsPresenter.newsArticle = articleToUse
    }
  }

}
