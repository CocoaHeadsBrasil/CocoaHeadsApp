import UIKit

@IBDesignable
class SettingsViewController: UIViewController {
    
    weak var nibView :SettingsView!
    
    let delegate: SettingsViewModelDelegate
    
    init(delegate: SettingsViewModelDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
        
        self.title = "Settings"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        if let selectedRow = self.nibView?.tableView.indexPathForSelectedRow {
            self.nibView?.tableView.deselectRowAtIndexPath(selectedRow, animated: animated)
        }
    }
    
    override func loadView() {
        let viewModel = SettingsViewModel(delegate: self.delegate)
        let view = SettingsView(viewModel: viewModel)
        
        self.view = view
        self.nibView = view
    }
}
