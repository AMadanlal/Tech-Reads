//
//  TechPresenterView.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/04/20.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import Foundation

public protocol TechNewsPresenterView: class {
  func updatePageContent(title: String, content: String, imageUrl: String)
}
