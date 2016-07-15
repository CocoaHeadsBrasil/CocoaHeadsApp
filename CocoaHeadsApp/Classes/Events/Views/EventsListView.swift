import UIKit
import RxSwift

class EventListView: NibDesignable {

    let viewModel = EventsListViewModel()
    var dataSource :EventsListTableDataSource!
    var delegate :EventsListTableDelegate!
    
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var listEventsTableView :UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listEventsTableView.registerNib(R.nib.eventsListTableViewCell)
        self.dataSource = EventsListTableDataSource(viewModel: self.viewModel)
        self.delegate = EventsListTableDelegate(viewModel: self.viewModel)
        self.listEventsTableView.dataSource = self.dataSource
        self.listEventsTableView.delegate = self.delegate
        viewModel.items.asObservable().subscribeNext { [weak self] (items) in
            self?.listEventsTableView.reloadData()
        }.addDisposableTo(self.disposeBag)
        //viewModel.loadMoreItens()
    }
}
