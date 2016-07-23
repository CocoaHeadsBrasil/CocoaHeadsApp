import UIKit

class MeetupCoordinator: BaseCoordinator {

    var rootViewController: UIViewController?
    
    override func start() -> UIViewController {
        let listController = MeetupListViewController()
        let navigationController = UINavigationController(rootViewController: listController)

        let chaptersNavigationItem = UIBarButtonItem()
        chaptersNavigationItem.title = "Chapters"
        chaptersNavigationItem.target = self
        chaptersNavigationItem.action = #selector(startChaptersCoordinator)
        listController.navigationItem.rightBarButtonItem = chaptersNavigationItem

        rootViewController = navigationController
        
        return navigationController
    }

    @objc func startChaptersCoordinator() {
        let chaptersCoordinator = ChaptersCoordinator(delegate: self)
        let chaptersRootViewController = chaptersCoordinator.start()
        self.rootViewController?.presentViewController(chaptersRootViewController, animated: true, completion: { [weak self] in
            self?.childrenCoordinator.append(chaptersCoordinator)
        })
    }
}
