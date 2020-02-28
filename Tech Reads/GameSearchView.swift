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
  }
  @IBAction func btngamedetails(_ sender: UIButton) {
  performSegue(withIdentifier: "gamesearch", sender: self)
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "searchsegue" {
      let segueDest = segue.destination as? SearchResultsTable
          segueDest?.searchString = txtFieldSearch.text!
      }
  }
  @IBAction func btnSearch(_ sender: UIButton) {
    search = txtFieldSearch.text
      performSegue(withIdentifier: "searchsegue", sender: self)
    }
}
