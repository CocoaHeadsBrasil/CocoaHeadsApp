import UIKit

struct Theme {
    static func setup() {
        UINavigationBar.appearance().tintColor = UIColor.cocoaHeadsMainColor()
        UITableViewCell.appearance().tintColor = UIColor.cocoaHeadsMainColor()
    }
}