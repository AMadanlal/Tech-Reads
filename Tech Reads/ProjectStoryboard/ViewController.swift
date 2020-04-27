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
  @IBOutlet weak var btnSearchOutlet: UIButton!
  @IBOutlet weak var btnGameOutlet: UIButton!
  @IBOutlet weak var btnTechOutlet: UIButton!
  var session: WCSession?
  @IBOutlet weak var btnPreferenceOutlet: UIButton!
  var newsList: NewsSource?
  var articleToUse: NewsSource.Article?

    override func viewDidLoad() {
      super.viewDidLoad()
      self.configureWatchKitSesstion()
      setGradientonBorder(button: btnSearchOutlet)
      setProperSpacing(in: btnSearchOutlet)
      setGradientonBorder(button: btnGameOutlet)
      setProperSpacing(in: btnGameOutlet)
      setGradientonBorder(button: btnTechOutlet)
      setProperSpacing(in: btnTechOutlet)
      setGradientonBorder(button: btnPreferenceOutlet)
      btnPreferenceOutlet.imageEdgeInsets = UIEdgeInsets(top: 10, left: -80, bottom: 10, right: 30)
      btnPreferenceOutlet.titleEdgeInsets = UIEdgeInsets(top: 0, left: -60, bottom: 0, right: 0)
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
