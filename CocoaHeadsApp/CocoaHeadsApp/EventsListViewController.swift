//
//  EventsDetailViewController.swift
//  CocoaHeadsApp
//
//  Created by Vinicius Carvalho on 14/03/16.
//  Copyright © 2016 CocoaHeads Brasil. All rights reserved.
//

import UIKit

@IBDesignable
class EventsViewController: UITableViewController {
    
    @IBOutlet weak var nibView: EventListView!

    private let eventsDetailSegue = "eventsDetailSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "CocoaHeads BR"
        
    }

}

