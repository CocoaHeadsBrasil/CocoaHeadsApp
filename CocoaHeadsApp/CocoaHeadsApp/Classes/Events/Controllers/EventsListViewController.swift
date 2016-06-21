import UIKit

@IBDesignable
class EventsListViewController: UITableViewController {
    
    @IBOutlet weak var nibView: EventListView!

    private let eventsDetailSegue = "eventsDetailSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "CocoaHeads BR"
        
    }

}
