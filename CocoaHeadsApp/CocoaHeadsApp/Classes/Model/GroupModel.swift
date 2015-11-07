//
//  GroupModel.swift
//  CocoaHeadsApp
//
//  Created by Bruno Bilescky on 06/11/15.
//  Copyright © 2015 CocoaHeads Brasil. All rights reserved.
//

import UIKit
import Unbox

class GroupModel: Unboxable {

    let joinMode :String
    let name :String
    let id :Int
    let urlName :String
    let who :String
    
    required init(unboxer: Unboxer) {
        joinMode = unboxer.unbox("join_mode")
        name = unboxer.unbox("name")
        id = unboxer.unbox("id")
        urlName = unboxer.unbox("urlname")
        who = unboxer.unbox("who")
    }
    
}
