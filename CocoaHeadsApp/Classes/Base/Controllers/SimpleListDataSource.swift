import UIKit

class SimpleListDataSource<T, CellType: UITableViewCell>: NSObject, UITableViewDataSource {

    let viewModel: SimpleListViewModel<T, CellType>

    init(viewModel: SimpleListViewModel<T, CellType>) {
        self.viewModel = viewModel
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.value.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as CellType
        let item = viewModel.items.value[indexPath.row]
        viewModel.configurationBlock?(cell, item)
        return cell
    }
}