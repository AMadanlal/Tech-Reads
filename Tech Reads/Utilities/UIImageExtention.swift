//
//  UIImageExtention.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/04/21.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import Foundation

extension UIImageView {
  public func image(fromUrl urlString: String) {
    guard let url = URL(string: urlString) else {
      print("Could not get Image")
      return
    }
    let theTask = URLSession.shared.dataTask(with: url) { data, response, _ in
      if let response = data {
        DispatchQueue.main.async {
          self.image = UIImage(data: response)
        }
      }
    }
    theTask.resume()
  }
}
