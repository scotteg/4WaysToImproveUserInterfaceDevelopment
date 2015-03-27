//
//  DesignableView.swift
//  CocoaConf2015
//
//  Created by Scott Gardner on 3/27/15.
//  Copyright (c) 2015 Scott Gardner. All rights reserved.
//

import UIKit

@IBDesignable class DesignableView: UIView {
  
  // MARK: - Border
  
   @IBInspectable var borderWidth: CGFloat = 0.0 {
    didSet { layer.borderWidth = borderWidth }
  }
  
  @IBInspectable var borderColor: UIColor = UIColor.clearColor() {
    didSet { layer.borderColor = borderColor.CGColor }
  }
  
  @IBInspectable var cornerRadius: CGFloat = 0.0 {
    didSet { layer.cornerRadius = cornerRadius }
  }
  
  // MARK: - Background
  
  @IBInspectable var startColor: UIColor = UIColor.clearColor() {
    didSet { setBackground() }
  }
  
  @IBInspectable var endColor: UIColor = UIColor.clearColor() {
    didSet { setBackground() }
  }
  
  // MARK: - Initialize
  
  override class func layerClass() -> AnyClass {
    return CAGradientLayer.self
  }
  
  var gradientLayer: CAGradientLayer {
    return layer as CAGradientLayer
  }
  
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    configure()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  func configure() {
    gradientLayer.startPoint = CGPointMake(0.0, 0.0)
    gradientLayer.endPoint = CGPointMake(0.0, 1.0)
    setBackground()
  }
  
  // MARK: - Triggered actions
  
  func setBackground() {
    let colors = [startColor.CGColor, endColor.CGColor]
    gradientLayer.colors = colors
  }
  
}
