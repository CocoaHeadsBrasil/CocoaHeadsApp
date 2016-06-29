import UIKit

class MeetupCoordinator: Coordinator {
    
    var delegate: CoordinatorDelegate?
    
    init(delegate: CoordinatorDelegate) {
        self.delegate = delegate
    }
    
    func start() -> UIViewController {
        let listController = MeetupListViewController()
        let navigationController = UINavigationController(rootViewController: listController)
        
        return navigationController
    }
    
}
