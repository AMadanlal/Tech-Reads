//
//  ColorExtention.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/04/27.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import Foundation

extension UIColor {
  public convenience init?(hex: String) {
    let red, green, blue, alpha: CGFloat
    if hex.hasPrefix("#") {
      let start = hex.index(hex.startIndex, offsetBy: 1)
      let hexColor = String(hex[start...])
      if hexColor.count == 8 {
        let scanner = Scanner(string: hexColor)
        var hexNumber: UInt64 = 0
        if scanner.scanHexInt64(&hexNumber) {
          red = CGFloat((hexNumber & 0xff000000) >> 24) / 255
          green = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
          blue = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
          alpha = CGFloat(hexNumber & 0x000000ff) / 255
          self.init(red: red, green: green, blue: blue, alpha: alpha)
          return
        }
      }
    }
    return nil
  }
}

public func setGradientonBorder(button: UIButton) {
  let gradient = CAGradientLayer()
  gradient.frame =  CGRect(origin: CGPoint.zero, size: button.frame.size)
  gradient.colors = [UIColor(hex: "#1E1CFF") ?? UIColor.blue.cgColor,
                     UIColor(hex: "#1CFFF5") ??  UIColor.cyan.cgColor]
  let shape = CAShapeLayer()
  shape.lineWidth = 4
  shape.path = UIBezierPath(roundedRect: button.bounds, cornerRadius: button.layer.cornerRadius-5).cgPath
  shape.strokeColor = UIColor.black.cgColor
  shape.fillColor = UIColor.clear.cgColor
  gradient.mask = shape
  button.layer.addSublayer(gradient)
  button.imageView?.contentMode = .scaleAspectFit
}

public func setProperSpacing(in button: UIButton) {
  button.imageEdgeInsets = UIEdgeInsets(top: 10, left: -40, bottom: 10, right: 30)
  button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -60, bottom: 0, right: 0)
}
