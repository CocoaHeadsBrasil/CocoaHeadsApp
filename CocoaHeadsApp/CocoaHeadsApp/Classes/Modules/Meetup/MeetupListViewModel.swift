//
//  MeetupListViewModel.swift
//  CocoaHeadsApp
//
//  Created by Bruno Bilescky on 06/11/15.
//  Copyright © 2015 CocoaHeads Brasil. All rights reserved.
//

import UIKit

class MeetupListViewModel: ViewModel {

    let numberOfItemsPerRequest  = 10
    let items = Dynamic<[MeetupModel]>([])
    
    func loadMoreItens() {
        switch self.currentState.value {
        case .Loading:
            return
        default:
            break
        }
        self.currentState.value = ViewModelState.InfiniteLoading
        MeetupAPIConsumer.consume(.ListEvents(perPage: self.numberOfItemsPerRequest, offset:items.value.count), success:self.handleAPIResponse)
    }
    
    func handleAPIResponse(response :MeetupListResponse) {
        self.items.value.appendContentsOf(response.results)
        logger.debug("Loaded: \(response.results)")
    }
    
}
