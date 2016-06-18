import UIKit

class EventListView: NibDesignable {

    let viewModel = EventsListViewModel()
    var dataSource :EventsListTableDataSource!
    var delegate :EventsListTableDelegate!
    
    @IBOutlet weak var listEventsTableView :UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listEventsTableView.registerNib(R.nib.eventsListTableViewCell)
        self.dataSource = EventsListTableDataSource(viewModel: self.viewModel)
        self.delegate = EventsListTableDelegate(viewModel: self.viewModel)
        self.listEventsTableView.dataSource = self.dataSource
        self.listEventsTableView.delegate = self.delegate
        viewModel.items.bind(self) {
                items in self.listEventsTableView.reloadData()
        }
        //viewModel.loadMoreItens()
    }
}
