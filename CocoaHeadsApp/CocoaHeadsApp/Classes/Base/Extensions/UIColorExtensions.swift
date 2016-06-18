import UIKit
import DynamicColor

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
