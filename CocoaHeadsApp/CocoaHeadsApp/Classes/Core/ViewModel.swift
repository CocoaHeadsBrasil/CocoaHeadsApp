//
//  ViewModel.swift
//  CocoaHeadsApp
//
//  Created by Bruno Bilescky on 06/11/15.
//  Copyright © 2015 CocoaHeads Brasil. All rights reserved.
//

import UIKit

/**
 Represents the current state of the viewModel
*/
enum ViewModelState {
    case Idle
    case Loading(percent :Float)
    case Error(ErrorType)
    case Success
    
    static let InfiniteLoading :ViewModelState = .Loading(percent: -1)
}

/**
 Stores all values and properties that are important for a view.
 It should not hold any reference to the view
*/
class ViewModel: NSObject {

    let currentState = Dynamic<ViewModelState>(.Idle)
    
}
