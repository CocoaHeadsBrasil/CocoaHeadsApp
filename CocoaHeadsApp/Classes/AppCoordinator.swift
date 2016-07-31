import UIKit

class AppCoordinator: ParentCoordinator, CoordinatorDelegate {
    
    let window = UIWindow(frame: UIScreen.mainScreen().bounds)
    var childrenCoordinator = [Coordinator]()
    
    func start() -> UIViewController {
        let meetupCoordinator = MeetupCoordinator(delegate: self)
        childrenCoordinator.append(meetupCoordinator)
        let meetupStartViewController = meetupCoordinator.start()
        
        window.rootViewController = meetupStartViewController
        window.makeKeyAndVisible()
        
        return meetupStartViewController
    }
}