//
//  URLPathTesting.swift
//  Tech ReadsTests
//
//  Created by Akshar Madanlal on 2020/04/29.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import XCTest
@testable import Tech_Reads
@testable import TechReadsPod

class URLPathTesting: XCTestCase {

  func testGivenGameSearchItemWhenCreatingURLThenReturnFormattedURLSTring() {
    let searchedItem = "borderlands"
    let varURL = GameURLPath().buildGameListURLPath(searchQuery: searchedItem)
    let resultURL = "https://chicken-coop.p.rapidapi.com/games?title=\(searchedItem)"
    XCTAssertTrue(varURL == resultURL)
  }

  func testGivenTechSerchItemWhenCreatingURLThenReturnFormattedURLString() {
    let searchedItem = "nvidia"
    let varURL = NewsURLPath().buildTechNewsPath(query: searchedItem)
    let resultURL = "https://newsapi.org/v2/top-headlines?country=za&category=technology&q=\(searchedItem)&pagesize=10"
      + "&apiKey=db03aae8ea77408ab75aa849fae46298"
    XCTAssertTrue(varURL == resultURL)
  }

}
