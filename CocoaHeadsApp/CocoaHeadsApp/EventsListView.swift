//
//  EventsListView.swift
//  CocoaHeadsApp
//
//  Created by Vinicius Carvalho on 31/03/16.
//  Copyright © 2016 CocoaHeads Brasil. All rights reserved.
//

import UIKit

class EventListView: NibDesignable {

    let viewModel = EventListViewModel()
    var dataSource :EventListTableDataSource!
    var delegate :EventListTableDelegate!
    
    @IBOutlet weak var listEventsTableView :UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listEventsView.registerNib(R.nib.eventListTableViewCell)
        self.dataSource = EventListTableDataSource(viewModel: self.viewModel)
        self.delegate = EventListTableDelegate(viewModel: self.viewModel)
        self.listEventsTableView.dataSource = self.dataSource
        self.listEventsTableView.delegate = self.delegate
        viewModel.items.bind(self) {
                items in self.listEventsTableView.reloadData()
        }
        viewModel.loadMoreItens()
    }
}
