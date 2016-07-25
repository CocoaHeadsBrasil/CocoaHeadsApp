import UIKit

class StatesListDataSource: NSObject, UITableViewDataSource {

    let viewModel: StatesListViewModel

    init(viewModel: StatesListViewModel) {
        self.viewModel = viewModel
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.value.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as StatesListTableViewCell
        cell.state.value = viewModel.items.value[indexPath.item]
        return cell
    }
}