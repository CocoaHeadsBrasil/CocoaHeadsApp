//
//  EventsTableVewCell.swift
//  CocoaHeadsApp
//
//  Created by Vinicius Carvalho on 16/03/16.
//  Copyright © 2016 CocoaHeads Brasil. All rights reserved.
//

import UIKit

class EventsListTableViewCell: UITableViewCell {

    @IBOutlet weak var eventTitleLabel: UILabel!
 
    override func awakeFromNib() {
        super.awakeFromNib()
        
        eventTitleLabel.textColor = .cocoaHeadsTitleColor()
        
    }
    
    let event = Dynamic<Events?>(nil)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        self.event.bind(self) { event in
            self.eventTitleLabel.text = event?.name ?? "Indisponível"
        }
    }
    
    func configure(withEvents events: Events, selectionEnabled: Bool = true, accessoryEnabled: Bool = true) {
        
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
