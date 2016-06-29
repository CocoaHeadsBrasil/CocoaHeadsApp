import UIKit

protocol CoordinatorDelegate {
    func coordinateDidEnd(coordinator: Coordinator)
}

protocol Coordinator: class {
    var delegate: CoordinatorDelegate? {get set}
    
    func start() -> UIViewController
}

class AppCoordinator: Coordinator, CoordinatorDelegate {
    
    let window = UIWindow(frame: UIScreen.mainScreen().bounds)
    var delegate: CoordinatorDelegate?
    var childrenCoordinator = [Coordinator]()
    
    func start() -> UIViewController {
        let tabBarController = UITabBarController()
        
        window.rootViewController = tabBarController
        
        var viewControllers = [UIViewController]()
        
        let meetupCoordinator = MeetupCoordinator(delegate: self)
        self.childrenCoordinator.append(meetupCoordinator)
        
        let meetupStartViewController = meetupCoordinator.start()
        viewControllers.append(meetupStartViewController)
        
        
        
        let settingsCoordinator = SettingsCoordinator(delegate: self)
        self.childrenCoordinator.append(settingsCoordinator)
        
        let settingsStartViewController = settingsCoordinator.start()
        viewControllers.append(settingsStartViewController)
        
        tabBarController.setViewControllers(viewControllers, animated: false)
        
        window.makeKeyAndVisible()
        
        return tabBarController
    }
    
    func coordinateDidEnd(coordinator: Coordinator) {
        if let coordinatorIndex = self.childrenCoordinator.indexOf({ $0 === coordinator }) {
            self.childrenCoordinator.removeAtIndex(coordinatorIndex)
        }
    }
    
}