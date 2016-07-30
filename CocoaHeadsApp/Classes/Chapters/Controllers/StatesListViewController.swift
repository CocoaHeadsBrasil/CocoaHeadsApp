import UIKit

class StatesListViewController: UITableViewController {

    weak var viewControllerDelegate: StatesListViewControllerDelegate?

    override func loadView() {
        title = "Estados"
        tableView = StatesListView(selectionCallback: { [weak self] (state) in
            guard let strongSelf = self else { return }
            strongSelf.viewControllerDelegate?.statesListViewController(strongSelf, didSelectState: state)
        })
    }
}

protocol StatesListViewControllerDelegate: class {
    func statesListViewController(viewController: StatesListViewController, didSelectState state: State)
}
