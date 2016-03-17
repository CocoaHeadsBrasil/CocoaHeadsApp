//
//  EventsDetailViewController.swift
//  CocoaHeadsApp
//
//  Created by Vinicius Carvalho on 14/03/16.
//  Copyright © 2016 CocoaHeads Brasil. All rights reserved.
//

import UIKit

class EventsViewController: UITableViewController {

    //private let events = Events.events
    private let eventsDetailSegue = "eventsDetailSegue"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(UINib(nibName: String(EventsTableViewCell), bundle: nil), forCellReuseIdentifier: String(EventsTableViewCell))
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(String(EventsTableViewCell), forIndexPath: indexPath) as! EventsTableViewCell
        
        //cell.configure(withEvents: events[indexPath.row])
        
        return cell
    }



}

