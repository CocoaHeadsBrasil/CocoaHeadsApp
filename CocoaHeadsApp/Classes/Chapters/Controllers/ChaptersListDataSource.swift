import UIKit

class ChaptersListDataSource: NSObject, UITableViewDataSource {

    let viewModel: ChaptersListViewModel

    init(viewModel: ChaptersListViewModel) {
        self.viewModel = viewModel
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.value.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as UITableViewCell
        let item = viewModel.items.value[indexPath.row]
        cell.textLabel?.text = item
        return cell
    }
}