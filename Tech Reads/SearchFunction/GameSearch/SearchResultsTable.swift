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

  @IBOutlet var tableViewOutlet: UITableView!
  @IBOutlet weak var mainLblOutlet: UILabel!
    let cellSpacingHeight: CGFloat = 20
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

  override func numberOfSections(in tableView: UITableView) -> Int {
    return gamesToDisplay.count
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }

  override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return cellSpacingHeight
  }
  // Make the background color show through
  override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let headerView = UIView()
    headerView.backgroundColor = UIColor.black
    return headerView
  }
  // create a cell for each table view row
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath)
    cell.textLabel?.text = gamesToDisplay[indexPath.section]
    cell.textLabel?.numberOfLines = 0;    cell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
    cell.backgroundColor = UIColor.lightGray
    cell.layer.borderColor = UIColor.systemBlue.cgColor
    cell.layer.borderWidth = 5
    cell.layer.cornerRadius = 20
    cell.clipsToBounds = true
    return cell
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    itemIndex = indexPath.section
    self.performSegue(withIdentifier: gameDetailSegue, sender: self)
  }

  func updateSearchItems(gameItems: [String]) {
    gamesToDisplay = gameItems
    mainLblOutlet.text = "Search Results for: \(searchItem)"
    tableView.reloadData()
  }

  func popUpWarning(title: String, message: String) {
    let alert = alertPopupBox(title: title, message: message)
    self.present(alert, animated: true, completion: nil)
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  if segue.identifier == gameDetailSegue {
    let segueDest = segue.destination as? GameReviewController
    segueDest?.isSearched = true
    segueDest?.gamePresenter.gameListItem = resultsPresenter.gameList?.result[itemIndex]
      }
    }
}
