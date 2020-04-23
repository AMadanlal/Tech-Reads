//
//  SaveUtility.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/04/04.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import Foundation
import TechReadsPod

@objc public class SaveUtilityPresenter: NSObject {
  weak var view: PreferenceUtilitiesPresenterView?
  var prefModel = PreferenceRepository()

  @objc public func setView(view: PreferenceUtilitiesPresenterView) {
    self.view = view
  }

  @objc public func saveMediumString(stringToSave: String) {
    let pUtilities = PreferenceUtilities()
    pUtilities.saveMedium(savingPref: stringToSave)
  }

  @objc public func saveMediumStringToDB(stringToSave: String) {
    PreferenceRepository().savePreferenceToDb(pref: stringToSave)
  }

  @objc public func loadMediumStringFromDB() {
    view?.updateLabel(PreferenceRepository().loadPreferenceFromDb())
  }

}
