//
//  GameAPICodeTest.swift
//  Tech ReadsTests
//
//  Created by Akshar Madanlal on 2020/04/29.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import XCTest
import OHHTTPStubs
@testable import Tech_Reads
@testable import TechReadsPod

class GameAPICodeTest: XCTestCase {

  var condition = 0

  override func setUp() {
    stub(condition: isHost("chicken-coop.p.rapidapi.com")) { _ in
      switch self.condition {
      case 0:
        let stubPath = OHPathForFile("GameInfo.json", type(of: self))
        return HTTPStubsResponse(fileAtPath: stubPath!,
                                 statusCode: 200,
                                 headers: ["Content-Type": "application/json"])
      default:
        let stubPath = OHPathForFile("GameList.json", type(of: self))
        return HTTPStubsResponse(fileAtPath: stubPath!,
                                 statusCode: 200,
                                 headers: ["Content-Type": "application/json"])
      }
    }
  }

  override func tearDown() {
  }

  func testGivenURLWhenRequestIsSentThenRecieveCorrectGameInformation() {
    condition = 0
    ChickenCoopAPI().getGameInfo(gameTitle: "borderlands", gamePlatform: "pc") { result in
      switch result {
      case .failure(let error):
        print(error)
        XCTFail("StubFailed")
      case.success(let details):
        XCTAssertTrue(details.title == "Borderlands")
      }
    }
  }

  func testGivenURLWhenItemIsSearchedThenRecieveCorrectItems() {
    condition = 1
    ChickenCoopAPI().getGameList(searchItem: "") { result in
      switch result {
      case .failure(let error):
        print(error)
        XCTFail("StubFailed")
      case.success(let details):
        XCTAssertTrue(details.result.count == 10)
      }
    }
  }

}
