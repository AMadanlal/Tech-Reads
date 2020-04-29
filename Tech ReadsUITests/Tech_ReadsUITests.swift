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
        continueAfterFailure = false
        application = XCUIApplication()
    }

  func testGameReview() {
    setupSnapshot(application)
    application.launch()
    application.buttons["General game reviews"].tap()
    sleep(10)//replace using XCWait
    snapshot("gameReview")
    application.buttons["<"].tap()
    XCTAssert(application.buttons["General game reviews"].exists)
  }

  func testsearchingfunction() {
    setupSnapshot(application)
    application.launch()
    application.buttons["Search Game or Tech"].tap()
    application.textFields["game or tech name"].tap()
    application.textFields["game or tech name"].typeText("borderlands")
    application.buttons["Search Game"].tap()
    sleep(9)//replace using XCWait
    snapshot("BorderlandsResult")
    application.staticTexts["Borderlands 3 on PS4"].tap()
    sleep(10)//replace using XCWait
    snapshot("Borderlands3Result")
    application.buttons["<"].tap()
    XCTAssert(application.buttons["Search Game or Tech"].exists)
  }

  func testUserPreferences() {
    setupSnapshot(application)
    application.launch()
    application.buttons["User Preferences"].tap()
    application.pickerWheels.element.adjust(toPickerWheelValue: "PC")
    application.buttons["Save Preferences"].tap()
    sleep(1)
    snapshot("preferences")
    XCTAssertEqual(application.staticTexts.element(matching: .any, identifier: "lblpreference").label, "PC")
  }
}
