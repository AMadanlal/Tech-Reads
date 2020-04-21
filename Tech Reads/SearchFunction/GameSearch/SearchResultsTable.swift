//
//  SearchResultsTable.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/02/18.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import UIKit
import TechReadsPod

class SearchResultsTable: UITableViewController {
  var searchString = ""
  var gamePlatform = ""
  var gamesToDisplay = [String]()
  var itemsToSend = [String]()
  var itemPlatform = [String]()

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func viewDidAppear(_ animated: Bool) {
    if gamesToDisplay.isEmpty {
      let gamelist = ChickenCoopAPI(searched: searchString, platform: gamePlatform)
        var gameListvariable = gamelist.gamelist
          gamelist.getGameList { result in
          switch result {
          case .failure(let error):
              print(error)
          case.success(let details):
              gameListvariable = details
                DispatchQueue.main.async {
                  for item in gameListvariable.result {
                    self.gamesToDisplay.append(item.title + " , on console: \(item.platform)" )
                    self.itemsToSend.append(item.title)
                    self.itemPlatform.append(item.platform)
                    self.tableView.reloadData()
                }
              }
            }
          }
      }
  }
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return gamesToDisplay.count
  }
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath)
    tableView.backgroundColor = UIColor.init(red: 153/255, green: 203/255, blue: 234/255, alpha: 1)
    cell.backgroundColor = UIColor.init(red: 153/255, green: 203/255, blue: 234/255, alpha: 1)
    cell.textLabel?.textColor = UIColor.blue// check this value
    cell.textLabel?.numberOfLines = 0
    cell.textLabel?.text = gamesToDisplay[indexPath.row]
    return cell
  }
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    searchString = itemsToSend[indexPath.row]
    gamePlatform = itemPlatform[indexPath.row]
    self.performSegue(withIdentifier: "detailsegue", sender: self)
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  if segue.identifier == "detailsegue" {
    let segueDest = segue.destination as? GameReviewController
    segueDest?.searcheditem = searchString
    segueDest?.gameplatform = gamePlatform
      }
    }
}
