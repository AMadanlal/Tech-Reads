//
//  TechResultsTableView.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/04/18.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import Foundation

class TechResultsTableView: UITableViewController, TechResultsPresenterView {

var techArticlesToDisplay = [String]()
var searchItem = ""
lazy var resultsPresenter = TechResultsPresenter(with: self)

  override func viewDidAppear(_ animated: Bool) {
    resultsPresenter.displayTechResults()
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return techArticlesToDisplay.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TechSearchCell", for: indexPath)
    cell.textLabel?.text = techArticlesToDisplay[indexPath.row]
    return cell
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    indexPath.row -> here we use this value to get a value from the array
    self.performSegue(withIdentifier: "TechDetailSegue", sender: self)
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  if segue.identifier == "TechDetailSegue" {
    let segueDest = segue.destination as? GeneralTechReview
//    let segueDest = segue.destination as? GeneralTechReview
//    let techDetailsPage = TechNewsPresenter(with: segueDest?)
//    techDetailsPage.article = get article from presenter
      }
    }

  func getSearchString() -> String {
    return searchItem
  }

  func updateSearchItems(newsItems: [String]) {
    techArticlesToDisplay = newsItems
  }

  func reloadTable() {
    tableView.reloadData()
  }

}
