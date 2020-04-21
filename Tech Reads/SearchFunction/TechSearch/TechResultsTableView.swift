//
//  TechResultsTableView.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/04/18.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import Foundation

class TechResultsTableView: UITableViewController, TechResultsPresenterView {
  var searchString: String {
    return searchItem
  }
  var techArticlesToDisplay = [String]()
  var searchItem = ""

  lazy var resultsPresenter = TechResultsPresenter(with: self)
  var itemIndex = 0

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
    itemIndex = indexPath.row
    self.performSegue(withIdentifier: "TechDetailSegue", sender: self)
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  if segue.identifier == "TechDetailSegue" {
    let segueDest = segue.destination as? GeneralTechReview
    segueDest?.isSearched = true
    segueDest?.newsPresenter.newsArticle = resultsPresenter.newsArticles?.articles[itemIndex]
      }
    }

  func updateSearchItems(newsItems: [String]) {
    techArticlesToDisplay = newsItems
    tableView.reloadData()
  }
}
