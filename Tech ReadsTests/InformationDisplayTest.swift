//
//  InformationDisplaytests.swift
//  Tech ReadsTests
//
//  Created by Akshar Madanlal on 2020/03/26.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import XCTest
import UIKit
@testable import Tech_Reads
@testable import TechReadsPod

class InformationDisplayTest: XCTestCase {
  var titleLabel: UILabel!
   var textView: UITextView!
   var imagePlace: UIImageView!

   override func setUp() {
     // Put setup code here. This method is called before the invocation of each test method in the class.
     titleLabel = UILabel()
     textView = UITextView()
     imagePlace = UIImageView()
   }

   func testDisplay() {
     let APIClass = ChickenCoopAPI(searched: "Borderlands", platform: "pc")
    var gameinfo = Game()
    APIClass.getGameInfo {result in
          switch result {
          case .failure(let error):
               XCTFail("The error is: \(error)")
          case.success(let details):
              gameinfo = details
              XCTAssertEqual(gameinfo.title, "Borderlands")
        }
    }
  }

  func testRandomDisplay() {
    let randomGameClass = RandomGameReview()
    randomGameClass.getRandomGameFromList { (listItem) in
      XCTAssertNotNil(listItem.title)
    }
  }

  func testArrayFormatter() {
    let gameInfo = Game()
    let displayClass = FormattingDisplayClass(gameM: gameInfo, lblTitle: self.titleLabel,
    txtView: self.textView, imgView: self.imagePlace)
    let exampleArray = ["MonkeysRule", "RemoveMe", "SwiftRules"]
    let actualResult = displayClass.stringArrayFormatter(textArray: exampleArray)
    let expectedResult = "MonkeysRule, RemoveMe, SwiftRules"
    XCTAssertEqual(actualResult, expectedResult)
  }

      override func tearDown() {
           // Put teardown code here. This method is called after the invocation of each test method in the class.
       titleLabel = nil
       textView = nil
       imagePlace = nil
       }
}
