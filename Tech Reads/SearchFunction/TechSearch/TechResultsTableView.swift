//
//  TechResultsTableView.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/04/18.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import Foundation

class TechResultsTableView: UITableViewController, TechResultsPresenterView {
  @IBOutlet var tableViewOutlet: UITableView!
  var searchString: String {
    return searchItem
  }

  @IBOutlet weak var lblResult: UILabel!
  let cellSpacingHeight: CGFloat = 20
  var techArticlesToDisplay = [String]()
  var searchItem = ""
  lazy var resultsPresenter = TechResultsPresenter(with: self)
  var itemIndex = 0

  override func viewDidAppear(_ animated: Bool) {
    resultsPresenter.displayTechResults()
  }

  override func numberOfSections(in tableView: UITableView) -> Int {
    return techArticlesToDisplay.count
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
    let cell = tableView.dequeueReusableCell(withIdentifier: "TechSearchCell", for: indexPath)
    cell.textLabel?.text = techArticlesToDisplay[indexPath.section]
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
    self.performSegue(withIdentifier: techDetailSegue, sender: self)
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  if segue.identifier == techDetailSegue {
    let segueDest = segue.destination as? GeneralTechReview
    segueDest?.isSearched = true
    segueDest?.newsPresenter.newsArticle = resultsPresenter.newsArticles?.articles[itemIndex]
      }
    }

  func updateSearchItems(newsItems: [String]) {
    techArticlesToDisplay = newsItems
    lblResult.text = "Search Results for: \(searchItem)"
    tableView.reloadData()
  }
}
