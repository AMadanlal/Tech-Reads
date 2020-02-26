//
//  UserPreferences.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/02/06.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import UIKit

class UserPreferencesController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
//    Array of consoles that the user is most likely to use
    let consoles = ["Any", "PC", "XBOX ONE", "PS4", "NINTENDO SWITCH", "MOBILE"]
    @IBOutlet weak var mediumLbl: UILabel!
    @IBOutlet weak var mainPrefLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var genreLbl: UILabel!
    @IBOutlet weak var lblCurrentMedium: UILabel!
  //let file = "UserMedium.txt" //this is the name of the file
    override func viewDidLoad() {
         super.viewDidLoad()
         // Do any additional setup after loading the view.
         mainPrefLabel.font=UIFont.italicSystemFont(ofSize: 35) //change the font of the main label
         mediumLbl.font = UIFont.italicSystemFont(ofSize: 20)
         genreLbl.font = UIFont.italicSystemFont(ofSize: 20)
         mainPrefLabel.numberOfLines = 2
         mainPrefLabel.center.x = self.view.center.x
         pickerView.delegate = self
         pickerView.dataSource = self
      pickerView.setValue(UIColor.blue, forKey: "textColor")
      
      /*
//      this is to load the data from the file
      if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
          let fileurl = dir.appendingPathComponent(file)
          do {
            let datafromfile = try String(contentsOf: fileurl, encoding: .utf8)
             lblCurrentMedium.text = datafromfile
          } catch {
            print(error)
          }
        }
      */
      
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return consoles.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return consoles[row]
    }
    @IBAction func btnGenreAdd(_ sender: UIButton) {
      performSegue(withIdentifier: "genrepopup", sender: self)
    }
//    this is a helper function that finds the URL path to where the app can store data
    func getDocumentsDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
//    this button is used to save the user preferences and go back to the previous page
    @IBAction func btnSavePref(_ sender: UIButton) {
      //        this line to go get the string value from the pickerview
              let answer: String = consoles[pickerView.selectedRow(inComponent: 0)]
            lblCurrentMedium.text = answer
      
      /*
      if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
        let fileurl = dir.appendingPathComponent(file)
        do {
          try answer.write(to: fileurl, atomically: false, encoding: .utf8)
        } catch {
          print(error)
        }
      }
      */
      
    }
}

class AddGenre: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var genrelbl: UILabel!
    @IBOutlet weak var genrelist: UIPickerView!
    @IBOutlet weak var savedgenre: UITextView!
    //let file = "UserGenres.txt" //this is the name of the file
    let genre = ["Any", "FPS", "Racing", "TPS", "RPG", "Action", "Horror", "Hack-and-Slash"]
  override func viewDidLoad() {
      genrelbl.font=UIFont.italicSystemFont(ofSize: 35)
      genrelist.delegate = self
      genrelist.dataSource = self
    genrelist.setValue(UIColor.blue, forKey: "textColor")
    
    
    /* if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
      let fileurl = dir.appendingPathComponent(file)
      do {
        let datafromfile = try String(contentsOf: fileurl, encoding: .utf8)
         savedgenre.text = datafromfile
      } catch {
        print(error)
        savedgenre.text = "List of Genre's: "
      }
    }*/
     
    
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
    savedgenre.text.append(answer)
    
    /*
   if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
        let fileurl = dir.appendingPathComponent(file)
        do {
          try savedgenre.text.write(to: fileurl, atomically: false, encoding: .utf8)
        } catch {
          print(error)
        }
      }*/
    
  }
}
