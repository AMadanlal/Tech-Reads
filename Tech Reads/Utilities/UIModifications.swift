//
//  UIModifications.swift
//  Tech Reads
//
//  Created by Akshar Madanlal on 2020/04/28.
//  Copyright © 2020 Akshar Madanlal. All rights reserved.
//

import Foundation

@objc public class PreferenceButtonModification: NSObject {
  @objc public func setUpButton(button: UIButton) {
    setButtonBorder(button: button)
    setProperSpacing(in: button, imageInsertLeft: -10, titleInsertLeft: -60)
  }
  @objc public func setUpLabel(label: UILabel) {
    setLabelBorder(label: label)
  }
}

 func getGradient(size: CGSize) -> CAGradientLayer {
  let gradient = CAGradientLayer()
  gradient.frame =  CGRect(origin: CGPoint.zero, size: size)
  gradient.colors = [UIColor(hex: "#1E1CFF") ?? UIColor.blue.cgColor,
                     UIColor(hex: "#1CFFF5") ??  UIColor.cyan.cgColor]
  gradient.name = "GradientLayer"
  return gradient
}

func getShape(bounds: CGRect, radius: CGFloat) -> CAShapeLayer {
  let shape = CAShapeLayer()
  shape.lineWidth = 4
  shape.path = UIBezierPath(roundedRect: bounds, cornerRadius: radius + 10).cgPath
  shape.strokeColor = UIColor.black.cgColor
  shape.fillColor = UIColor.clear.cgColor
  shape.name = "ShapeLayer"
  return shape
}

public func setLabelBorder(label: UILabel) {
  if let oldGradientLayer = label.layer.sublayers?.filter({$0.name == "GradientLayer"}).first {
    oldGradientLayer.removeFromSuperlayer()
  }
  if let oldShapeLayer = label.layer.sublayers?.filter({$0.name == "ShapeLayer"}).first {
    oldShapeLayer.removeFromSuperlayer()
  }
  let shape = getShape(bounds: label.bounds, radius: label.layer.cornerRadius)
  let gradient = getGradient(size: label.frame.size)
  gradient.mask = shape
  label.layer.addSublayer(gradient)
}

public func setButtonBorder(button: UIButton) {
  if let oldGradientLayer = button.layer.sublayers?.filter({$0.name == "GradientLayer"}).first {
    oldGradientLayer.removeFromSuperlayer()
  }
  if let oldShapeLayer = button.layer.sublayers?.filter({$0.name == "ShapeLayer"}).first {
    oldShapeLayer.removeFromSuperlayer()
  }
  let shape = getShape(bounds: button.bounds, radius: button.layer.cornerRadius)
  let gradient = getGradient(size: button.frame.size)
  gradient.mask = shape
  button.layer.addSublayer(gradient)
  button.imageView?.contentMode = .scaleAspectFit
}

public func setTextViewBorder(field: UIView) {
  if let oldGradientLayer = field.layer.sublayers?.filter({$0.name == "GradientLayer"}).first {
    oldGradientLayer.removeFromSuperlayer()
  }
  if let oldShapeLayer = field.layer.sublayers?.filter({$0.name == "ShapeLayer"}).first {
    oldShapeLayer.removeFromSuperlayer()
  }
  let shape = getShape(bounds: field.bounds, radius: field.layer.cornerRadius)
  let gradient = getGradient(size: field.frame.size)
  gradient.mask = shape
  field.layer.addSublayer(gradient)
}

public func setProperSpacing(in button: UIButton, imageInsertLeft: CGFloat, titleInsertLeft: CGFloat) {
  button.imageEdgeInsets = UIEdgeInsets(top: 10, left: imageInsertLeft, bottom: 10, right: 30)
  button.titleEdgeInsets = UIEdgeInsets(top: 0, left: titleInsertLeft, bottom: 0, right: 0)
}
