//
//  SavingPreference.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/04/22.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import Foundation
import CoreData

class PreferenceModel {
  var preferenceInstance = NSManagedObject()

  func savePreferenceToDb(pref: String) {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
    let managedContext = appDelegate.persistentContainer.viewContext
    let entity = NSEntityDescription.entity(forEntityName: "Preferences", in: managedContext)!
    let preference = NSManagedObject(entity: entity, insertInto: managedContext)
    preference.setValue(pref, forKeyPath: "consolePreference")
    do {
      try managedContext.save()
    } catch let error as NSError {
      print("Could not save. \(error), \(error.userInfo)")
    }
  }

  func loadPreferenceFromDb() -> String {
    var preferenceToLoad = "Any"
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return "Any"}
    let managedContext = appDelegate.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Preferences")
    do {
      let results = try managedContext.fetch(fetchRequest)
      for res in results {
        preferenceToLoad = res.value(forKeyPath: "consolePreference") as? String ?? "Any"
      }
    } catch let error as NSError {
      print("Could not fetch. \(error), \(error.userInfo)")
    }
    return preferenceToLoad
  }

}
