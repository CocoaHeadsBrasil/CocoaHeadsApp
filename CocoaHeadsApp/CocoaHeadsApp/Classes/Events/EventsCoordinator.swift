import UIKit

class EventsCoordinator: Coordinator {
    
    var delegate: CoordinatorDelegate?
    
    init(delegate: CoordinatorDelegate) {
        self.delegate = delegate
    }
    
    func start() -> UIViewController {
        let listController = EventsListViewController()
        let navigationController = UINavigationController(rootViewController: listController)
        
        return navigationController
    }
    
}
