//
//  PopUpBox.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/04/29.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import Foundation

public func alertPopupBox(title: String, message: String) -> UIAlertController {
  let alert = UIAlertController(title: title,
                                message: message,
                                preferredStyle: .alert)
  alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
return alert
}
