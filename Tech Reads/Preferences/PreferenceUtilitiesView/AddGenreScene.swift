//
//  UserPreferences.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/02/06.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import UIKit
import TechReadsPod

class AddGenre: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var genrelbl: UILabel!
    @IBOutlet weak var genrelist: UIPickerView!
    @IBOutlet weak var savedgenre: UITextView!
    let genre = ["Any", "FPS", "Racing", "TPS", "RPG", "Action", "Horror", "Hack-and-Slash"]
  override func viewDidLoad() {
      genrelbl.font=UIFont.italicSystemFont(ofSize: 35)
      genrelist.delegate = self
      genrelist.dataSource = self
      genrelist.setValue(UIColor.blue, forKey: "textColor")
    //      loading the genre
      savedgenre.text = loadGenre()
  }
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
      return 1
  }
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
      return genre.count
  }
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
      return genre[row]
  }
  @IBAction func btnAddGen(_ sender: UIButton) {
    var answer = genre[genrelist.selectedRow(inComponent: 0)]
    answer += " ,"
    var stringtosave = ""
    savedgenre.text.append(answer)
    stringtosave = savedgenre.text
    saveGenre(genretosave: stringtosave)
  }
}
