//
//  GradientBackgroundView.swift
//  CocoaConf2015
//
//  Created by Scott Gardner on 3/27/15.
//  Copyright (c) 2015 Scott Gardner. All rights reserved.
//

import UIKit

@IBDesignable class GradientBackgroundView: UIView {
  
  @IBInspectable var color1: UIColor = UIColor.clearColor()
  @IBInspectable var color2: UIColor = UIColor.clearColor()
  
  override func drawRect(rect: CGRect) {
    CocoaConf2015StyleKit.drawGradientBackgroundView(frame: frame, color1: color1, color2: color2)
  }
  
}
