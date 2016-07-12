import UIKit
import RxSwift

class EventsListTableViewCell: UITableViewCell {

    @IBOutlet weak var eventTitleLabel: UILabel!
    
    let disposeBag = DisposeBag()
 
    override func awakeFromNib() {
        super.awakeFromNib()
        
        eventTitleLabel.textColor = .cocoaHeadsTitleColor()
        
    }
    
    let event = Variable<Event?>(nil)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        self.event.asObservable().subscribeNext { [weak self] (event) in
            self?.eventTitleLabel.text = event?.name ?? "Indisponível"
        }.addDisposableTo(self.disposeBag)
    }
    
    func configure(withEvents events: Event, selectionEnabled: Bool = true, accessoryEnabled: Bool = true) {
        
        eventTitleLabel.text = events.name
    
        if selectionEnabled == false {
            selectionStyle = .None
        }
        
        if accessoryEnabled == false {
            accessoryType = .None
        }
    
    
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.event.value = nil
    }
}
