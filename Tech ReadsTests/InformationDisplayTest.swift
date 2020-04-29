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

   override func setUp() {
     // Put setup code here. This method is called before the invocation of each test method in the class.
   }

  func testArrayFormatter() {
    let displayClass = GameInfoProcess()
    let exampleArray = ["MonkeysRule", "RemoveMe", "SwiftRules"]
    let actualResult = displayClass.stringArrayFormatter(textArray: exampleArray)
    let expectedResult = "MonkeysRule, RemoveMe, SwiftRules"
    XCTAssertEqual(actualResult, expectedResult)
  }

      override func tearDown() {
           // Put teardown code here. This method is called after the invocation of each test method in the class.
       }
}
