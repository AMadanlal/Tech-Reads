//
//  SearchResultsTable.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/02/18.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import UIKit
import TechReadsPod

class SearchResultsTable: UITableViewController, GameResultsPresenterView {

  var searchString: String {
    return searchItem
  }
  var gamesToDisplay = [String]()
  var searchItem = ""
  lazy var resultsPresenter = GameResultsPresenter(with: self)
  var itemIndex = 0

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func viewDidAppear(_ animated: Bool) {
    resultsPresenter.displayGameResults()
  }
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return gamesToDisplay.count
  }
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath)
    cell.textLabel?.textColor = UIColor.blue
    cell.textLabel?.numberOfLines = 0
    cell.textLabel?.text = gamesToDisplay[indexPath.row]
    return cell
  }
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    itemIndex = indexPath.row
    self.performSegue(withIdentifier: gameDetailSegue, sender: self)
  }

  func updateSearchItems(gameItems: [String]) {
    gamesToDisplay = gameItems
    tableView.reloadData()
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  if segue.identifier == gameDetailSegue {
    let segueDest = segue.destination as? GameReviewController
    segueDest?.isSearched = true
    segueDest?.gamePresenter.gameListItem = resultsPresenter.gameList?.result[itemIndex]
      }
    }
}
