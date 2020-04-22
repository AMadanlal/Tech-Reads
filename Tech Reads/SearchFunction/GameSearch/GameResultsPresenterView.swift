//
//  GameResultsPresenterView.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/04/22.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import Foundation

public protocol GameResultsPresenterView: class {
  func updateSearchItems(gameItems: [String])
  var searchString: String { get }
}
