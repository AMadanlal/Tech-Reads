//
//  SessionHandler.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/04/24.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

//import Foundation
//import WatchConnectivity
//
//class SessionHandler: NSObject {
//  var session: WCSession?
//
//  override init() { self.configureWatchKitSesstion() }
//
//  func btnConnectToWatch() {
//    if let validSession = self.session, validSession.isReachable {//5.1
//      let data: [String: Any] = ["iPhone": "Info from the phone!" as Any] // Create your Dictionay as per uses
//      validSession.sendMessage(data, replyHandler: nil, errorHandler: nil)
//    }
//  }
//
//  func configureWatchKitSesstion() {
//    if WCSession.isSupported() {
//      session = WCSession.default
//      session?.delegate = self
//      session?.activate()
//    }
//  }
//
//}
//
// WCSession delegate functions
//extension SessionHandler: WCSessionDelegate {
//
//  func sessionDidBecomeInactive(_ session: WCSession) {
//  }
//
//  func sessionDidDeactivate(_ session: WCSession) {
//  }
//
//  func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState,
//               error: Error?) {
//  }
//
//  func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
//    print("received message: \(message)")
//    DispatchQueue.main.async {
//      if let value = message["Connect"] as? String {
//       do something with value
//      }
//    }
//  }
//}
