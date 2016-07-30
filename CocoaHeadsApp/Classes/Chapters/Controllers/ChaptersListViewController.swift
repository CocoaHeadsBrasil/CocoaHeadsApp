import UIKit

class ChaptersListViewController: UITableViewController {

    var state: State?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = state?.name ?? "Capítulos"
    }
}