import UIKit

class MeetupCoordinator: BaseCoordinator {
    
    override func start() -> UIViewController {
        let listController = MeetupListViewController()
        let navigationController = UINavigationController(rootViewController: listController)
        
        return navigationController
    }
    
}
