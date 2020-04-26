//
//  InterfaceController.swift
//  TopHeadlinesWatchApp Extension
//
//  Created by Akshar Madanlal on 2020/04/23.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController {
  let session = WCSession.default
  @IBOutlet weak var articleImage: WKInterfaceImage!
  @IBOutlet weak var articleTitle: WKInterfaceLabel!
  @IBOutlet weak var btnGoToAppOutlet: WKInterfaceButton!
  @IBOutlet weak var btnNewArticleOutlet: WKInterfaceButton!
  var titleOfArticleToSendBack: String = ""

  override func awake(withContext context: Any?) {
    super.awake(withContext: context)
    session.delegate = self
    session.activate()
  }

  @IBAction func btnGoToApp() {
    let data: [String: Any] = ["ArticleTitle": titleOfArticleToSendBack as Any]
    session.sendMessage(data, replyHandler: nil, errorHandler: nil)
  }
  @IBAction func btnNewArticle() {
    let data: [String: Any] = ["RandomData": "Get Random Article" as Any]
    session.sendMessage(data, replyHandler: nil, errorHandler: nil)
  }

  override func willActivate() {
    // This method is called when watch view controller is about to be visible to user
    super.willActivate()
  }
  override func didDeactivate() {
    // This method is called when watch view controller is no longer visible
    super.didDeactivate()
  }

  @IBAction func btnGetHeadlines() {
    let data: [String: Any] = ["NewData": "Get Headline" as Any]
    session.sendMessage(data, replyHandler: nil, errorHandler: nil)
  }

}

extension InterfaceController: WCSessionDelegate {
  func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState,
               error: Error?) {
  }

  func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
    if let value = message["title"] as? String {
      self.articleTitle.setHidden(false)
      titleOfArticleToSendBack = value
      self.articleTitle.setText(value)
    }
    if let value = message["imageUrl"] as? String {
      self.articleImage.image(fromUrl: value)
    }
    self.btnGoToAppOutlet.setHidden(false)
    self.btnNewArticleOutlet.setHidden(false)
  }
}
