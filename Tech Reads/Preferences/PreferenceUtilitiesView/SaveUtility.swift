//
//  SaveUtility.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/04/04.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import Foundation
import TechReadsPod

@objc public class SaveUtility: NSObject {
  @objc public func saveMediumString(stringToSave: String) {
    let pUtilities = PreferenceUtilities()
    pUtilities.saveMedium(savingPref: stringToSave)
  }
}
