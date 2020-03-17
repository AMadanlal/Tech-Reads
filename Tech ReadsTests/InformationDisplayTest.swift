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
  var titlelabel: UILabel!
  var textview: UITextView!
  var imageplace: UIImageView!

  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    titlelabel = UILabel()
    textview = UITextView()
    imageplace = UIImageView()
  }
  func testDisplay() {
    let mockAPI = ChickenCoopMockAPI()
    var gameinfo = Game()
    mockAPI.getGameInfo { result in
                  switch result {
                  case .failure(let error):
                    print(error)
                  case.success(let details):
                      gameinfo = details
                      print(details)
                          todisplay(gamemodel: gameinfo, titlelabel: self.titlelabel, textview: self.textview,
                                    imageplace: self.imageplace)
                          XCTAssertEqual(self.titlelabel.text, gameinfo.title)
          }
        }
      }

     override func tearDown() {
          // Put teardown code here. This method is called after the invocation of each test method in the class.
      titlelabel = nil
      textview = nil
      imageplace = nil
      }

}
