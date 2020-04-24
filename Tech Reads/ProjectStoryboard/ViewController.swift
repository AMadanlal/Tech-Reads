//
//  ViewController.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/02/04.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import UIKit
import QuartzCore
import TechReadsPod
import WatchConnectivity

class ViewController: UIViewController {
   var session: WCSession?
    override func viewDidLoad() {
        super.viewDidLoad()
      self.configureWatchKitSesstion()
    }

  func sendArticleItem() {
    NewsAPICalls().getNewsList { result in
        switch result {
        case .failure(let error):
        print(error)
        case.success(let details):
        let article: NewsSource.Article? = details.articles.first
        guard let val = article else { return }
        DispatchQueue.main.async {
          let articleTitleToSend: [String: Any] = ["title": val.title ]
          let articleDescriptionToSend: [String: Any] = ["description": val.description ?? ""]
          let articleImageToSend: [String: Any] = ["imageUrl": val.urlToImage?.absoluteString ?? "No imageURL"]
          if let validSession = self.session, validSession.isReachable {
            validSession.sendMessage(articleTitleToSend, replyHandler: nil, errorHandler: nil)
            validSession.sendMessage(articleDescriptionToSend, replyHandler: nil, errorHandler: nil)
            validSession.sendMessage(articleImageToSend, replyHandler: nil, errorHandler: nil)
          }
        }
      }
    }
  }

  @IBAction func btnConnect(_ sender: UIButton) {
    sendArticleItem()
  }

  @IBOutlet weak var mainlabel: UILabel!
//    this button takes the user to the search page
  @IBAction func btnSearch(_ sender: UIButton) {
     performSegue(withIdentifier: "SearchBranch", sender: self)
  }
//    this button is to go to the preferences page
  @IBAction func btnPref(_ sender: UIButton) {
     performSegue(withIdentifier: "PrefBranch", sender: self)
  }
  //    this button is to take the user to the general tech review page
  @IBAction func btnTechReview(_ sender: UIButton) {
     performSegue(withIdentifier: "TechRevBranch", sender: self)
  }
//    this button takes the user to the general game review pages
  @IBAction func btnGameReview(_ sender: UIButton) {
    performSegue(withIdentifier: "GameRevBranch", sender: self)
  }
//    this function is to perform the unwind segue
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue) {
    }

  func configureWatchKitSesstion() {
    if WCSession.isSupported() {
      session = WCSession.default
      session?.delegate = self
      session?.activate()
    }
  }

}

// WCSession delegate functions
extension ViewController: WCSessionDelegate {

  func sessionDidBecomeInactive(_ session: WCSession) {
  }

  func sessionDidDeactivate(_ session: WCSession) {
  }

  func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState,
               error: Error?) {
  }

  func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
    print("received message: \(message)")
    DispatchQueue.main.async {
      if let value = message["Connect"] as? String {
        self.mainlabel.text = value
      }
    }
  }
}
