import UIKit

class ChaptersCoordinator: BaseCoordinator {

    var navigationController: UINavigationController?

    override func start() -> UIViewController {
        let listController = StatesListViewController()
        listController.viewControllerDelegate = self
        self.navigationController = UINavigationController(rootViewController: listController)

        let saveButtonItem = UIBarButtonItem(
            title: "Salvar",
            style: .Done,
            target: self,
            action: #selector(saveAndFinishCoordinator)
        )
        listController.navigationItem.rightBarButtonItem = saveButtonItem

        return navigationController!
    }

    @objc func saveAndFinishCoordinator() {
        navigationController?.dismissViewControllerAnimated(true, completion: { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.coordinateDidEnd(strongSelf)
        })
    }
}

extension ChaptersCoordinator: StatesListViewControllerDelegate {

    func statesListViewController(viewController: StatesListViewController, didSelectState state: State) {
        let chaptersListViewController = ChaptersListViewController()
        chaptersListViewController.state = state
        navigationController?.pushViewController(chaptersListViewController, animated: true)
    }
}