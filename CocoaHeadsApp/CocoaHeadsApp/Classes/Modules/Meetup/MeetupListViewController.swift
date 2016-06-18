import UIKit

@IBDesignable
class MeetupListViewController: UIViewController {

    @IBOutlet weak var nibView :MeetupListView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "CocoaHeads BR"
    }

}
