//
//  SearchResultsTable.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/02/18.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import UIKit

class SearchResultsTable: UITableViewController {
  var thingstodisplay = [String]()
  //function for instructions as soon as view is called
  override func viewDidLoad() {
    super.viewDidLoad()
    thingstodisplay = ["BMW M3", "M4 ASSAULT", "COMPUTER", "GAMES", "METAL MUSIC", "MAX"]
  }
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return thingstodisplay.count
  }
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath)
    cell.textLabel?.text = thingstodisplay[indexPath.row]
    return cell
  }
}
