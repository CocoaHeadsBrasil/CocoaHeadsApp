//
//  EventsTableVewCell.swift
//  CocoaHeadsApp
//
//  Created by Vinicius Carvalho on 16/03/16.
//  Copyright © 2016 CocoaHeads Brasil. All rights reserved.
//

import UIKit

class EventsTableViewCell: UITableViewCell {

    @IBOutlet weak var eventTitleLabel: UILabel!
 
    override func awakeFromNib() {
        super.awakeFromNib()
        
        eventTitleLabel.textColor = .cocoaHeadsTitleColor()
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
}
