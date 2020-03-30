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
//     let mockAPI = ChickenCoopMockAPI()
//     var gameInfo = Game()
//     mockAPI.getGameInfo { result in
//                   switch result {
//                   case .failure(let error):
//                     print(error)
//                   case.success(let details):
//                       gameInfo = details
//                    let displayClass = FormattingDisplayClass(gameM: gameInfo, lblTitle: self.titleLabel,
//                                                       txtView: self.textView, imgView: self.imagePlace)
//                       displayClass.todisplay()
//                           XCTAssertEqual(self.titleLabel.text, gameInfo.title)
//           }
//         }
     let APIClass = ChickenCoopAPI(searched: "Borderlands", platform: "pc")
    var gameinfo = Game()
    APIClass.getGameInfo {result in
          switch result {
          case .failure(let error):
              print(error)
          case.success(let details):
              gameinfo = details
              XCTAssertEqual(gameinfo.title, "Borderlands")
//                DispatchQueue.main.async {
//
//              }
        }
    }
  }

//  need to build and check if this runs correctly
  func testRandomDisplay() {
    let randomGameClass = RandomGameReview()
    randomGameClass.getRandomGameFromList { (listItem) in
      XCTAssertNotNil(listItem.title)
    }
  }
//  need to build and check if this runs correctly
  func testArrayFormatter() {
//    let APIClass = ChickenCoopAPI(searched: "", platform: "")
    let gameInfo = Game()
    let displayClass = FormattingDisplayClass(gameM: gameInfo, lblTitle: self.titleLabel,
    txtView: self.textView, imgView: self.imagePlace)
    let exampleArray = ["MonkeysRule", "RemoveMe", "SwiftRules"]
    let resultstring = displayClass.stringArrayFormatter(textArray: exampleArray)
    let result = "MonkeysRule, RemoveMe, SwiftRules"
    XCTAssertEqual(resultstring, result)
  }

      override func tearDown() {
           // Put teardown code here. This method is called after the invocation of each test method in the class.
       titleLabel = nil
       textView = nil
       imagePlace = nil
       }
}
