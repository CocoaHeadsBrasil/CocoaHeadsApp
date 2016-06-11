//
//  EventsListViewModel.swift
//  CocoaHeadsApp
//
//  Created by Vinicius Carvalho on 31/03/16.
//  Copyright © 2016 CocoaHeads Brasil. All rights reserved.
//

import UIKit

class EventsListViewModel: ViewModel {
    
    var numberOfItemsPerRequest = 20
    var currentPage = 0
    let items = Dynamic<[Event]>([])
    


}
