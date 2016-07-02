import UIKit

class SettingsView: NibDesignable {
    
    let viewModel: SettingsViewModel
    
    @IBOutlet weak var tableView :UITableView!
    var dataSource: SettingsTableViewDataSource!
    var delegate: SettingsTableViewDelegate!
    
    
    init(viewModel: SettingsViewModel) {
        self.viewModel = viewModel
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = SettingsTableViewDataSource(viewModel: self.viewModel)
        self.dataSource.registerCellsIdentifiers(self.tableView)
        self.tableView.dataSource = self.dataSource
        
        self.delegate = SettingsTableViewDelegate(viewModel: self.viewModel)
        self.tableView.delegate = self.delegate
    }
    
}
