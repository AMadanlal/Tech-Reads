//
//  SearchResultsTable.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/02/18.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import UIKit

class SearchResultsTable: UITableViewController {
  var searchString = ""
  var thingstodisplay = [String]()
  //function for instructions as soon as view is called
  override func viewDidLoad() {
    super.viewDidLoad()
    thingstodisplay = [String]()
  }
  override func viewDidAppear(_ animated: Bool) {
    if thingstodisplay.count == 0 {
      print(searchString)
      let gamelist = ChickenCoopAPI(searched: searchString)
        var gameListvariable = gamelist.gamelist
          gamelist.getGameList { result in
          switch result {
          case .failure(let error):
              print(error)
          case.success(let details):
              gameListvariable = details
              print(details)
                DispatchQueue.main.async {
                  for item in gameListvariable.result {
                    self.thingstodisplay.append(item.title)
                    self.tableView.reloadData()
                  }
              }
            }
          }
      }
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
