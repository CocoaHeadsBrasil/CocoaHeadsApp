import UIKit

@IBDesignable
class EventsListViewController: UITableViewController {
    
    private let eventsDetailSegue = "eventsDetailSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "CocoaHeads BR"
        
    }

    override func loadView() {
        let eventListView = EventListView()
        
        self.view = eventListView
    }
    
}

