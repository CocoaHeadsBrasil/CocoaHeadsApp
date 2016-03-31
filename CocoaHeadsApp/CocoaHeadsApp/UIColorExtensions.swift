//
//  UIColorExtensions.swift
//  CocoaHeadsApp
//
//  Created by Vinicius Carvalho on 16/03/16.
//  Copyright © 2016 CocoaHeads Brasil. All rights reserved.
//

import UIKit

extension UIColor {

    class func cocoaHeadsMainColor() -> UIColor {
        return UIColor(hexString: "#102319")
    }
    
    class func cocoaHeadsTitleColor() -> UIColor {
        return UIColor.cocoaHeadsMainColor()
    }
    
    class func cocoaHeadsSubtitleColor() -> UIColor {
        return UIColor.darkGrayColor()
    }

}
