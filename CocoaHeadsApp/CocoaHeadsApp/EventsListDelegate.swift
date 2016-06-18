import UIKit

class EventsListTableDelegate: NSObject, UITableViewDelegate {

    let viewModel:EventsListViewModel
    
    init (viewModel:EventsListViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        guard indexPath.item > viewModel.items.value.count - 5 else {
            return
        }
        //viewModel.loadMoreItens()
    }
}
