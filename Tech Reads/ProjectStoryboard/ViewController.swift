//
//  ViewController.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/02/04.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import UIKit
import QuartzCore
import WatchConnectivity

class ViewController: UIViewController {
   var session: WCSession?
    override func viewDidLoad() {
        super.viewDidLoad()
      self.configureWatchKitSesstion()
    }

  @IBAction func btnConnect(_ sender: UIButton) {
        if let validSession = self.session, validSession.isReachable {//5.1
          let data: [String: Any] = ["iPhone": "Info from the phone!" as Any] // Create your Dictionay as per uses
          validSession.sendMessage(data, replyHandler: nil, errorHandler: nil)
        }
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
