import UIKit

class ChaptersListViewController: UITableViewController {

    var state: State?

    override func loadView() {
        tableView = ChaptersListView()
        title = state?.name ?? "Capítulos"
    }
}