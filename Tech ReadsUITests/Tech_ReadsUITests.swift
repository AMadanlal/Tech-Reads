//
//  Tech_ReadsUITests.swift
//  Tech ReadsUITests
//
//  Created by Akshar Madanlal on 2020/02/04.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import XCTest

class TechReadsUITests: XCTestCase {
  var application: XCUIApplication!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        application = XCUIApplication()
    }

  func testGameReview() {
    application.launch()
    application.buttons["General game reviews"].tap()
    sleep(7)
    application.buttons["Back"].tap()
    XCTAssert(application.buttons["General game reviews"].exists)
  }

  func testsearchingfunction() {
    application.launch()
    application.buttons["Search Game or Tech"].tap()
    application.textFields["game or tech name"].tap()
    application.textFields["game or tech name"].typeText("borderlands")
//    application.keys["b"].tap()
//    application.keys["o"].tap()
//    application.keys["r"].tap()
//    application.keys["d"].tap()
//    application.keys["e"].tap()
//    application.keys["r"].tap()
//    application.keys["l"].tap()
//    application.keys["a"].tap()
//    application.keys["n"].tap()
//    application.keys["d"].tap()
//    application.keys["s"].tap()
    application.buttons["Search"].tap()
    sleep(7)
    application.staticTexts["Borderlands 3 , on console: PS4"].tap()
    sleep(7)
    application.buttons["Back"].tap()
    XCTAssert(application.buttons["Search Game or Tech"].exists)
  }

  func testUserPreferences() {
    application.launch()
    application.buttons["User Preferences"].tap()
    application.pickerWheels.element.adjust(toPickerWheelValue: "PC")
    application.buttons["Save Preferences"].tap()
    sleep(1)
    XCTAssertEqual(application.staticTexts.element(matching: .any, identifier: "lblpreference").label, "PC")
  }
}
