//
//  SaveLoadTest.swift
//  Tech ReadsTests
//
//  Created by Akshar Madanlal on 2020/03/30.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import XCTest
@testable import Tech_Reads
@testable import TechReadsPod

class SaveLoadTest: XCTestCase {

    override func setUp() {
    }

  func testSavingAndLoading() {
    let prefUtilities = PreferenceUtilities()
    prefUtilities.saveMedium(savingPref: "PC")
    let loadUtility = SavingUtilities()
    let loadedMedium = loadUtility.loadMedium()
    XCTAssertEqual(loadedMedium, "PC")
  }

    override func tearDown() {
    }

}
