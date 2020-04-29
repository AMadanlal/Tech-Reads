//
//  TechResultsPresenterView.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/04/20.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import Foundation

public protocol TechResultsPresenterView: class {
  func updateSearchItems(newsItems: [String])
  var searchString: String { get }
  func popUpWarning(title: String, message: String)
}
