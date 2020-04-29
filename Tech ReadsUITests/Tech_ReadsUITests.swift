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

  func testGameReviewNavigation() {
    setupSnapshot(application)
    application.launch()
    application.buttons["General game reviews"].tap()
    let button = application.buttons["<"]
    let exists = NSPredicate(format: "exists == 1")
    exceptionUse(exists: exists, staticText: button)
    application.buttons["<"].tap()
    XCTAssert(application.buttons["General game reviews"].exists)
  }

  func testTechNewsScreen() {
    setupSnapshot(application)
    application.launch()
    application.buttons["General Tech News"].tap()
    let label = application.staticTexts["Loading..."]
    let exists = NSPredicate(format: "exists == 0")
    exceptionUse(exists: exists, staticText: label)
    application.buttons["<"].tap()
    XCTAssert(application.buttons["General game reviews"].exists)
  }

  func testTechNewsNavigation() {
    setupSnapshot(application)
    application.launch()
    application.buttons["General Tech News"].tap()
    let button = application.buttons["<"]
    let exists = NSPredicate(format: "exists == 1")
    exceptionUse(exists: exists, staticText: button)
    application.buttons["<"].tap()
    XCTAssert(application.buttons["General Tech News"].exists)
  }

  func exceptionUse(exists: NSPredicate, staticText: XCUIElement) {
    expectation(for: exists, evaluatedWith: staticText, handler: nil)
    waitForExpectations(timeout: 10, handler: nil)
  }

  func testGameSearchingFunction() {
    setupSnapshot(application)
    application.launch()
    application.buttons["Search Game or Tech"].tap()
    application.textFields["game or tech name"].tap()
    application.textFields["game or tech name"].typeText("borderlands")
    application.buttons["Search Game"].tap()
    let cell = application.staticTexts["Borderlands 3 on PS4"]
    let exists = NSPredicate(format: "exists == 1")
    exceptionUse(exists: exists, staticText: cell)
    snapshot("BorderlandsResult")
    application.staticTexts["Borderlands 3 on PS4"].tap()
    let label = application.staticTexts["Borderlands 3"]
    exceptionUse(exists: exists, staticText: label)
    snapshot("Borderlands3Result")
    application.buttons["<"].tap()
    XCTAssert(application.buttons["Search Game or Tech"].exists)
  }

  func testSearchModes() {
    application.launch()
    application.buttons["Search Game or Tech"].tap()
    application.segmentedControls.buttons.element(boundBy: 1).tap()
    XCTAssertTrue(application.buttons["Search Tech"].exists)
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
