//
//  MeetupListViewModel.swift
//  CocoaHeadsApp
//
//  Created by Bruno Bilescky on 06/11/15.
//  Copyright © 2015 CocoaHeads Brasil. All rights reserved.
//

import UIKit

class MeetupListViewModel: ViewModel {

    let numberOfItemsPerRequest  = 25
    var currentPage = 0
    let items = Dynamic<[MeetupModel]>([])
    
    func loadMoreItens() {
        switch self.currentState.value {
        case .Loading:
            return
        case .Success:
            return
        default:
            break
        }
        self.currentState.value = ViewModelState.InfiniteLoading
        MeetupAPIConsumer.consume(.ListEvents(perPage: self.numberOfItemsPerRequest, pageOffset:self.currentPage), success: self.handleAPIResponseSuccess, failure: self.handleAPIResponseFailure)
    }
    
    func handleAPIResponseSuccess(response :MeetupListResponse) {
        logger.debug("Loaded: \(response.results.count) meetups")
        self.items.appendContentsOf(response.results)
        self.currentPage += 1
        dispatch_async(dispatch_get_main_queue()) {
            let newStatus :ViewModelState = response.meta.totalCount == self.items.value.count ? .Success : .Idle
            self.currentState.value = newStatus
        }
    }
    
    func handleAPIResponseFailure(error :ErrorType) {
        logger.error("Error: \(error)")
        self.currentState.value = .Error(error)
    }
    
}
