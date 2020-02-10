//
//  UserPreferences.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/02/06.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import UIKit

//need to change the normal class declaration to support the UIPicker protocall.
class UserPreferencesController : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource
{
//    Array of consoles that the user is most likely to use
    let consoles = ["Any","PC","XBOX ONE","PS4","NINTENDO SWITCH","MOBILE"]
 
    
    override func viewDidLoad()
    {
         super.viewDidLoad()
         // Do any additional setup after loading the view.
         MainPrefLabel.font=UIFont.italicSystemFont(ofSize: 35) //change the font of the main label
         mediumLbl.font = UIFont.italicSystemFont(ofSize: 20)
         GenreLbl.font = UIFont.italicSystemFont(ofSize: 20)
         MainPrefLabel.numberOfLines = 2
         MainPrefLabel.center.x = self.view.center.x
         pickerView.delegate = self
         pickerView.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return consoles.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return consoles[row]
    }
    
    @IBOutlet weak var mediumLbl: UILabel!
    @IBOutlet weak var MainPrefLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var GenreLbl: UILabel!
    @IBAction func AddGenBtn(_ sender: Any)
    {
        performSegue(withIdentifier: "GenreBranch", sender: self)
    }
    
//    this button is used to save the user preferences and go back to the previous page
    @IBAction func btnSave(_ sender: UIButton)
    {
//check if this button still has function as it is accociated to a unwind segue
        
    }
    

}


class AddGenre :  UIViewController, UIPickerViewDelegate, UIPickerViewDataSource
{
    
    override func viewDidLoad()
    {
        genrelbl.font=UIFont.italicSystemFont(ofSize: 35)
        genrelist.delegate = self
        genrelist.dataSource = self
    }
    
    
     let genre = ["Any","FPS","Racing","TPS","RPG","Action","Horror","Hack-and-Slash"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genre.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genre[row]
    }
    
    @IBOutlet weak var genrelbl: UILabel!
    @IBOutlet weak var genrelist: UIPickerView!
    @IBOutlet weak var savedgenre: UITextView!
    
}
