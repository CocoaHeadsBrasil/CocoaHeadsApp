import UIKit

class AppCoordinator: ParentCoordinator, CoordinatorDelegate {
    
    let window = UIWindow(frame: UIScreen.mainScreen().bounds)
    var childrenCoordinator = [Coordinator]()
    
    func start() -> UIViewController {
        let tabBarController = UITabBarController()
        
        window.rootViewController = tabBarController
        
        var viewControllers = [UIViewController]()
        
        let meetupCoordinator = MeetupCoordinator(delegate: self)
        childrenCoordinator.append(meetupCoordinator)
        
        let meetupStartViewController = meetupCoordinator.start()
        viewControllers.append(meetupStartViewController)
        
        let settingsCoordinator = SettingsCoordinator(delegate: self)
        childrenCoordinator.append(settingsCoordinator)
        
        let settingsStartViewController = settingsCoordinator.start()
        viewControllers.append(settingsStartViewController)
        
        tabBarController.setViewControllers(viewControllers, animated: false)
        
        window.makeKeyAndVisible()
        
        return tabBarController
    }
}