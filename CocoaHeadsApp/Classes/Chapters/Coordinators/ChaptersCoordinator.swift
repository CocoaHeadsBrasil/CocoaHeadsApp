import UIKit

class ChaptersCoordinator: BaseCoordinator {

    var rootViewController: UIViewController?

    override func start() -> UIViewController {
        let listController = StatesListViewController()
        let navigationController = UINavigationController(rootViewController: listController)

        let saveButtonItem = UIBarButtonItem(
            title: "Salvar",
            style: .Done,
            target: self,
            action: #selector(saveAndFinishCoordinator)
        )
        listController.navigationItem.rightBarButtonItem = saveButtonItem

        rootViewController = navigationController

        return navigationController
    }

    @objc func saveAndFinishCoordinator() {
        rootViewController?.dismissViewControllerAnimated(true, completion: { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.coordinateDidEnd(strongSelf)
        })
    }
}