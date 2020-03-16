//
//  Tech_ReadsTests.swift
//  Tech ReadsTests
//
//  Created by Akshar Madanlal on 2020/02/04.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import XCTest
@testable import Tech_Reads

class TechReadsTests: XCTestCase {
  var preferencesClass: UserPreferencesController!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
      preferencesClass = UserPreferencesController()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
      let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
      let pathreturned = path[0]
      let savepath = preferencesClass.getDocumentsDirectory()
      XCTAssertEqual(savepath, pathreturned)
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
    }

}
