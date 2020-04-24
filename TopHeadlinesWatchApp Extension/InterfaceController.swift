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
  @IBOutlet weak var articleDescription: WKInterfaceLabel!

  override func awake(withContext context: Any?) {
    super.awake(withContext: context)
    session.delegate = self
    session.activate()
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
    let data: [String: Any] = ["Connect": "data from watch" as Any] //Create your dictionary as per uses
    session.sendMessage(data, replyHandler: nil, errorHandler: nil)
  }

}

extension InterfaceController: WCSessionDelegate {
  func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState,
               error: Error?) {
  }

  func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
    if let value = message["title"] as? String {
      self.articleTitle.setText(value)
    }
    if let value = message["description"] as? String {
      self.articleDescription.setText(value)
    }
    if let value = message["imageUrl"] as? String {
      print(value)
      self.articleImage.image(fromUrl: value)
    }
  }
}
