//
//  APIConnectionCodeMockTesting.swift
//  Tech ReadsTests
//
//  Created by Akshar Madanlal on 2020/04/29.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import XCTest
import OHHTTPStubs
@testable import Tech_Reads
@testable import TechReadsPod

class APIConnectionCodeMockTesting: XCTestCase {
var condition = 0

  override func setUp() {
    stub(condition: isHost("newsapi.org")) { _ in
      switch self.condition {
      case 0:
        let stubPath = OHPathForFile("NewsList.json", type(of: self))
        return HTTPStubsResponse(fileAtPath: stubPath!,
                                 statusCode: 200,
                                 headers: ["Content-Type": "application/json"])
      default:
        let stubPath = OHPathForFile("CustomNewsList.json", type(of: self))
        return HTTPStubsResponse(fileAtPath: stubPath!,
                                 statusCode: 200,
                                 headers: ["Content-Type": "application/json"])
      }
    }
  }

  override func tearDown() {
  }

  func testGivenURLWhenRequestIsSentThenRecieveRightAmountOfItems() {
    condition = 0
    let exception = XCTestExpectation(description: "Waiting for file to get data")
    NewsAPICalls().getNewsList { result in
      switch result {
      case .failure(let error):
        print(error)
        XCTFail("StubFailed")
      case.success(let details):
        XCTAssertTrue(details.articles.count == 10)
        exception.fulfill()
      }
    }
     wait(for: [exception], timeout: 3)
  }

  func testGivenURLWhenItemIsSearchedThenRecieveCorrectItems() {
    condition = 1
    let exception = XCTestExpectation(description: "Waiting for file to get data")
    NewsAPICalls().getCustomNewsList(searchitem: "Samsung") { result in
      switch result {
      case .failure(let error):
        print(error)
        XCTFail("StubFailed")
      case.success(let details):
        XCTAssertTrue(details.articles.count == 2)
        exception.fulfill()
      }
    }
     wait(for: [exception], timeout: 3)
  }

}
