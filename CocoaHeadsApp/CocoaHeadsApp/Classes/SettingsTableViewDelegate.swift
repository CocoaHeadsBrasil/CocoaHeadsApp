import UIKit

class SettingsTableViewDelegate: NSObject, UITableViewDelegate {
     
    let viewModel :SettingsViewModel
    
    init(viewModel :SettingsViewModel) {
        self.viewModel = viewModel
        super.init()
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        viewModel.select(index: indexPath.row)
    }
    
}