import UIKit

class SettingsTableViewDataSource: NSObject, UITableViewDataSource {
    
    let viewModel :SettingsViewModel
    
    init(viewModel :SettingsViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    func registerCellsIdentifiers(tableView: UITableView) {
        tableView.registerCell(UITableViewCell.self)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.settings.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        
        switch viewModel.settings[indexPath.row] {
        case .Acknowledgements:
            cell.textLabel?.text = "Acknowledgements"
            cell.accessoryType = .DisclosureIndicator
        }
        
        return cell
    }
}
