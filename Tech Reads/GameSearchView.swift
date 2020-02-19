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
  var num: Int = 10 //this is just a test variable
    override func viewDidLoad() {
        super.viewDidLoad()
    }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier == "searchsegue" {
          if let destinationTC = segue.destination as? SearchResultsTable {
            destinationTC.itemcount = num
          }
      }
  }
    @IBAction func btnSearch(_ sender: UIButton) {
      performSegue(withIdentifier: "searchsegue", sender: self)
    }
}
