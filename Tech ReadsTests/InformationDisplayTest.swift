//
//  InformationDisplayTest.swift
//  Tech ReadsTests
//
//  Created by Akshar Madanlal on 2020/03/17.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import XCTest
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
    let mockAPI = ChickenCoopMockAPI()
    var gameInfo = Game()
    mockAPI.getGameInfo { result in
                  switch result {
                  case .failure(let error):
                    print(error)
                  case.success(let details):
                      gameInfo = details
                      let displayClass = FormattingDisplayClass(gameM: gameInfo, lblTitle: self.titleLabel,
                                                      txtView: self.textView, imgView: self.imagePlace)
                      displayClass.todisplay()
                          XCTAssertEqual(self.titleLabel.text, gameInfo.title)
          }
        }
      }

     override func tearDown() {
          // Put teardown code here. This method is called after the invocation of each test method in the class.
      titleLabel = nil
      textView = nil
      imagePlace = nil
      }

}
