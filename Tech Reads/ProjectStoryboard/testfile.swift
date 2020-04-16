//
//  testfile.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/04/15.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import Foundation

class TestClass: UIViewController {
  @IBOutlet weak var reslbl: UILabel!

  override func viewDidLoad() {
       super.viewDidLoad()
   }
  
  @IBAction func btnNews(_ sender: Any) {
    getNewsList { result in
      switch result {
      case .failure(let error):
        print(error)
      case.success(let details):
        DispatchQueue.main.async {
//          print shit here
//          getArticle(theArticle: details.articles.randomElement()!, textViewToUse: reslbl)
        }
      }
    }
  }
}
