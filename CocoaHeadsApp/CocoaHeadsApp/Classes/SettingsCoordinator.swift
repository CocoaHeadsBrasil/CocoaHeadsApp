import UIKit
import CPDAcknowledgements

class SettingsCoordinator: BaseCoordinator, SettingsViewModelDelegate {
 
    var navigationController: UINavigationController?
    
    override func start() -> UIViewController {
        let listController = SettingsViewController(delegate: self)
        let navigationController = UINavigationController(rootViewController: listController)
        
        self.navigationController = navigationController
        
        return navigationController
    }
    
    func userDidSelect(selectedValue: Settings) {
        switch selectedValue {
        case .Acknowledgements:
            let acknowledgementsViewController = CPDAcknowledgementsViewController()
            self.navigationController?.pushViewController(acknowledgementsViewController, animated: true)
        }
    }
}


