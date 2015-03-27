//
//  MoodSlider.swift
//  CocoaConf2015
//
//  Created by Scott Gardner on 3/27/15.
//  Copyright (c) 2015 Scott Gardner. All rights reserved.
//

import UIKit

@IBDesignable class MoodSlider: UIControl {
  
  @IBInspectable var value: Int = 2 {
    didSet { setNeedsDisplay() }
  }
  
  override func drawRect(rect: CGRect) {
    CocoaConf2015StyleKit.drawMoodSlider(moodValue: String(value))
  }
  
  // MARK: - Touch handling
  
  override func beginTrackingWithTouch(touch: UITouch, withEvent event: UIEvent) -> Bool {
    updateValueForTouch(touch)
    return true
  }
  
  override func continueTrackingWithTouch(touch: UITouch, withEvent event: UIEvent) -> Bool {
    updateValueForTouch(touch)
    return true
  }
  
  func updateValueForTouch(touch: UITouch) {
    let yValue = touch.locationInView(self).y
    let increment = bounds.height / 5.0
    
    switch yValue {
    case let y where y < increment:
      value = 4
    case let y where y < 2.0 * increment:
      value = 3
    case let y where y < 3.0 * increment:
      value = 2
    case let y where y < 4.0 * increment:
      value = 1
    default:
      value = 0
    }
    
    sendActionsForControlEvents(.ValueChanged)
  }
  
}
