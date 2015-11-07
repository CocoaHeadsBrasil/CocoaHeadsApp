//
//  ViewModel.swift
//  CocoaHeadsApp
//
//  Created by Bruno Bilescky on 06/11/15.
//  Copyright © 2015 CocoaHeads Brasil. All rights reserved.
//

import UIKit

enum ViewModelState {
    case Idle
    case Loading(percent :Float)
    
    static let InfiniteLoading :ViewModelState = .Loading(percent: -1)
}

class ViewModel: NSObject {

    let currentState = Dynamic<ViewModelState>(.Idle)
    
}
