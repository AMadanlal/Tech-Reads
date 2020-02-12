//
//  UserPreferences.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/02/06.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import UIKit

//need to change the normal class declaration to support the UIPicker protocall.
class UserPreferencesController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
//    Array of consoles that the user is most likely to use
    let consoles = ["Any", "PC", "XBOX ONE", "PS4", "NINTENDO SWITCH", "MOBILE"]
    @IBOutlet weak var mediumLbl: UILabel!
    @IBOutlet weak var mainPrefLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var genreLbl: UILabel!
    @IBOutlet weak var lblCurrentMedium: UILabel!
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
//        check saved preferences file for gaming medium and display it in a label.
        if let filepath = Bundle.main.path(forResource: "output", ofType: "txt") {
            do {
                let contents = try String(contentsOfFile: filepath)
                lblCurrentMedium.text = contents
            } catch {
//            do error handling for reading from the file
                print("error while reading: \(error).")
            }
        } else {lblCurrentMedium.text="You have not saved preferences yet"}
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
    @IBAction func addGenBtn(_ sender: Any) {
        performSegue(withIdentifier: "GenreBranch", sender: self)
    }
//    this is a helper function that finds the URL path to where the app can store data
    func getDocumentsDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
//    this button is used to save the user preferences and go back to the previous page
    @IBAction func btnSave(_ sender: UIButton) {
//        this line to go get the string value from the pickerview
        let answer: String = consoles[pickerView.selectedRow(inComponent: 0)]
        print(answer)  //just to test if the collected string is correct
        let filename = getDocumentsDirectory().appendingPathComponent("output.txt")
        do {
            try answer.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
        } catch {
//            do error handling to make sure program does not crash.
            print("error while reading: \(error).")
        }
    }
}

class AddGenre: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var genrelbl: UILabel!
     @IBOutlet weak var genrelist: UIPickerView!
     @IBOutlet weak var savedgenre: UITextView!
    override func viewDidLoad() {
        genrelbl.font=UIFont.italicSystemFont(ofSize: 35)
        genrelist.delegate = self
        genrelist.dataSource = self
    }
     let genre = ["Any", "FPS", "Racing", "TPS", "RPG", "Action", "Horror", "Hack-and-Slash"]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genre.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genre[row]
    }
}
