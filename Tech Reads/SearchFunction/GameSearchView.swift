//
//  GameSearchView.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/02/06.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import UIKit

class GameSearchView: UIViewController, UITextViewDelegate {
  @IBOutlet weak var txtFieldSearch: UITextField!
  var search: String? = ""
  override func viewDidLoad() {
      super.viewDidLoad()
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow),
                                           name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide),
                                           name: UIResponder.keyboardWillHideNotification, object: nil)
  }

  @objc func keyboardWillShow(notification: NSNotification) {
      if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as?
        NSValue)?.cgRectValue {
          if self.view.frame.origin.y == 0 {
              self.view.frame.origin.y -= keyboardSize.height
          }
      }
  }

  @objc func keyboardWillHide(notification: NSNotification) {
      if self.view.frame.origin.y != 0 {
          self.view.frame.origin.y = 0
      }
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == gameResultsPageSegue {
      let segueDest = segue.destination as? SearchResultsTable
      segueDest?.searchItem = txtFieldSearch.text ?? ""
      }
    if segue.identifier == techResultsPageSegue {
    let segueDest = segue.destination as? TechResultsTableView
        segueDest?.searchItem = txtFieldSearch.text ?? ""
    }
  }
  @IBAction func btnSearch(_ sender: UIButton) {
    search = txtFieldSearch.text
      performSegue(withIdentifier: gameResultsPageSegue, sender: self)
    }
  @IBAction func btnTechSearch(_ sender: UIButton) {
    search = txtFieldSearch.text
    performSegue(withIdentifier: techResultsPageSegue, sender: self)
  }
}
