//
//  EventsListDataSource.swift
//  CocoaHeadsApp
//
//  Created by Vinicius Carvalho on 31/03/16.
//  Copyright © 2016 CocoaHeads Brasil. All rights reserved.
//

import UIKit

class EventsListTableDataSource: NSObject, UITableViewDataSource {

    let viewModel :EventsListViewModel
    
    init(viewModel : EventsListViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    // MARK: - Table view data source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.items.value.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let reuseIdentifier = R.nib.eventListTableViewCell.identifier
        let cell = tableView.dequeueReusableCellWithIdentifier(String(EventsTableViewCell), forIndexPath: indexPath) as! EventsTableViewCell
        
        guard let eventsCell = cell as? EventsTableViewCell else {
            return cell
        }
        
        eventsCell.events.value = viewModel.items.value[indexPath.item]
        return eventsCell
    }

}
