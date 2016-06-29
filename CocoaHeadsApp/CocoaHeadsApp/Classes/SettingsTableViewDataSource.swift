import UIKit

class SettingsTableViewDataSource: NSObject, UITableViewDataSource {
    
    let viewModel :SettingsViewModel
    
    init(viewModel :SettingsViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.settings.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        switch self.viewModel.settings[indexPath.row] {
        case .Acknowledgements:
            cell.textLabel?.text = "Acknowledgements"
            cell.accessoryType = .DisclosureIndicator
        }
        
        return cell
    }
}
