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
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.dataSource = SettingsTableViewDataSource(viewModel: self.viewModel)
        self.delegate = SettingsTableViewDelegate(viewModel: self.viewModel)
        self.tableView.dataSource = self.dataSource
        self.tableView.delegate = self.delegate
//        viewModel.items.bind(self) { items in
//            self.listCollectionView.reloadData()
//        }
//        viewModel.loadMoreItens()
    }
    
}
