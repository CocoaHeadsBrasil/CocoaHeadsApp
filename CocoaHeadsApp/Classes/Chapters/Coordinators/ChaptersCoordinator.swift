import UIKit

class ChaptersCoordinator: BaseCoordinator {

    override func start() -> UIViewController {
        let listController = StatesListViewController()
        let navigationController = UINavigationController(rootViewController: listController)

        return navigationController
    }
}