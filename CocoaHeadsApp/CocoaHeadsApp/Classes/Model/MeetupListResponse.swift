//
//  MeetupListResponse.swift
//  CocoaHeadsApp
//
//  Created by Bruno Bilescky on 06/11/15.
//  Copyright © 2015 CocoaHeads Brasil. All rights reserved.
//

import UIKit
import Unbox

class MetaMeetupResponse: Unboxable {
    
    let totalCount :Int
    let count :Int
    
    required init(unboxer: Unboxer) {
        totalCount = unboxer.unbox("total_count")
        count = unboxer.unbox("count")
    }
}

class MeetupListResponse: Unboxable {

    let results :[MeetupModel]
    let meta :MetaMeetupResponse
    
    required init(unboxer: Unboxer) {
        meta = unboxer.unbox("meta")
        results = unboxer.unbox("results")
    }
    
}
