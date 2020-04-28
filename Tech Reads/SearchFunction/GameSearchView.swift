//
//  GameSearchView.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/02/06.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import UIKit

class GameSearchView: UIViewController, UITextViewDelegate {
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var txtFieldSearch: UITextField!
  @IBOutlet weak var segmentedControlOutlet: UISegmentedControl!
  var search: String? = ""
  @IBOutlet weak var btnGameOutlet: UIButton!
  @IBOutlet weak var btnTechOutlet: UIButton!

  @IBAction func segmentedControl(_ sender: UISegmentedControl) {
    switch segmentedControlOutlet.selectedSegmentIndex {
    case 0:
      btnTechOutlet.isHidden = true
      btnGameOutlet.isHidden = false
    case 1:
      btnTechOutlet.isHidden = false
      btnGameOutlet.isHidden = true
    default:
      break
    }
  }

  override func viewDidLoad() {
      super.viewDidLoad()
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow),
                                           name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide),
                                           name: UIResponder.keyboardWillHideNotification, object: nil)
    setUI()
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    setUI()
  }

  func setUI() {
    self.view.layer.borderColor = UIColor.blue.cgColor
    self.view.layer.cornerRadius = 30.0
    self.view.layer.borderWidth = 5.0
    setLabelBorder(label: titleLabel)
    setButtonBorder(button: btnGameOutlet)
    setProperSpacing(in: btnGameOutlet, imageInsertLeft: -20, titleInsertLeft: -50)
    setButtonBorder(button: btnTechOutlet)
    setProperSpacing(in: btnTechOutlet, imageInsertLeft: -20, titleInsertLeft: -50)
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
