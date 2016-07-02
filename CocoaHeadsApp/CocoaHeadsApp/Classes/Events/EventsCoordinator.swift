import UIKit

class EventsCoordinator: BaseCoordinator {
    
    override func start() -> UIViewController {
        let listController = EventsListViewController()
        let navigationController = UINavigationController(rootViewController: listController)
        
        return navigationController
    }
    
}
