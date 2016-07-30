import UIKit

class StatesListDelegate: NSObject, UITableViewDelegate {

    let viewModel: StatesListViewModel

    init(viewModel: StatesListViewModel) {
        self.viewModel = viewModel
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50.0
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let state = viewModel.items.value[indexPath.row]
        viewModel.selectionCallback?(state)
    }
}