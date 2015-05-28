//
//  KTDesignableView.swift
//  Kittens
//
//  Created by Ryan Blunden on 28/05/2015.
//  Copyright (c) 2015 RabbitBird Pty Ltd. All rights reserved.
//

import Foundation
import UIKit



@IBDesignable
public class KTDesignableView: UIView {
  
  @IBInspectable public var bgColor: UIColor = UIColor.clearColor() {
    didSet {
      backgroundColor = bgColor
    }
  }
  
  @IBInspectable public var cornerRadius: CGFloat = 0 {
    didSet {
      layer.cornerRadius = cornerRadius
      layer.masksToBounds = cornerRadius > 0
    }
  }
  
  @IBInspectable public var borderWidth: CGFloat = 0 {
    didSet {
      layer.borderWidth = borderWidth
    }
  }
  
  @IBInspectable public var borderColor: UIColor? {
    didSet {
      layer.borderColor = borderColor?.CGColor
    }
  }
  
  required public init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupButton()
  }
  
  func setupButton() {
    layer.masksToBounds = true
  }
}
