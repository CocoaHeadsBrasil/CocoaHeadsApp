//
//  GradientView.swift
//  CocoaHeadsApp
//
//  Created by Bruno Bilescky on 16/11/15.
//  Copyright © 2015 CocoaHeads Brasil. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {
    
    @IBInspectable var startColor :UIColor = UIColor.blackColor() {
        didSet {
            self.updateGradient()
        }
    }
    @IBInspectable var endColor :UIColor = UIColor.blackColor().colorWithAlphaComponent(0.0) {
        didSet {
            self.updateGradient()
        }
    }
    
    let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        self.layer.addSublayer(gradientLayer)
        self.backgroundColor = UIColor.clearColor()
        updateGradient()
    }
    
    override func prepareForInterfaceBuilder() {
        commonInit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = self.bounds
    }
    
    private func updateGradient() {
        gradientLayer.colors = [endColor.CGColor, startColor.CGColor]
    }
    
}
