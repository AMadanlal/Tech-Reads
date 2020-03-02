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
  var gplatform: String = ""
  var thingstodisplay = [String]()
  var itemstosend = [String]()
  var itemplatform = [String]()
  //function for instructions as soon as view is called
  override func viewDidLoad() {
    super.viewDidLoad()
    thingstodisplay = [String]()
  }
  override func viewDidAppear(_ animated: Bool) {
    if thingstodisplay.count == 0 {
      let gamelist = ChickenCoopAPI(searched: searchString, platform: "")
        var gameListvariable = gamelist.gamelist
          gamelist.getGameList { result in
          switch result {
          case .failure(let error):
              print(error)
          case.success(let details):
              gameListvariable = details
                DispatchQueue.main.async {
                  for item in gameListvariable.result {
                    self.thingstodisplay.append(item.title + " , on console: \(item.platform)" )
                    self.itemstosend.append(item.title)
                    self.itemplatform.append(item.platform)
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
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  if segue.identifier == "detailsegue" {
    let segueDest = segue.destination as? GameReviewController
    segueDest?.searcheditem = searchString
    segueDest?.gameplatform = gplatform
      }
    }
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    searchString = itemstosend[indexPath.row]
     gplatform = itemplatform[indexPath.row].lowercased()
    print(searchString)
    print(gplatform)
    self.performSegue(withIdentifier: "detailsegue", sender: self)
  }
}
