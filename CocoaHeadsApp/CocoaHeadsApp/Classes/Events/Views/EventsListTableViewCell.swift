import UIKit

class EventsListTableViewCell: UITableViewCell {

    @IBOutlet weak var eventTitleLabel: UILabel!
 
    override func awakeFromNib() {
        super.awakeFromNib()
        
        eventTitleLabel.textColor = .cocoaHeadsTitleColor()
        
    }
    
    let event = Dynamic<Event?>(nil)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        self.event.bind(self) { event in
            self.eventTitleLabel.text = event?.name ?? "Indisponível"
        }
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
