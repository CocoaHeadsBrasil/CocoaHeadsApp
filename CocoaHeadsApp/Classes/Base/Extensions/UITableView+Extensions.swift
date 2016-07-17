import UIKit

extension UITableView {
    
    func registerCell(cellClass: UITableViewCell.Type) {
        self.registerClass(cellClass, forCellReuseIdentifier: String(cellClass))
    }
    
    func dequeueReusableCell<T>(forIndexPath indexPath: NSIndexPath) -> T {
        guard let cell = self.dequeueReusableCellWithIdentifier(String(T.self), forIndexPath: indexPath) as? T else {
            fatalError("Cell of type \(String(T)) was not registred on table view")
        }
        
        return cell
    }
    
}
