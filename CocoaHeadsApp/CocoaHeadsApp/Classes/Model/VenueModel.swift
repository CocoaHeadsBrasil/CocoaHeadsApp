//
//  VenueModel.swift
//  CocoaHeadsApp
//
//  Created by Bruno Bilescky on 06/11/15.
//  Copyright © 2015 CocoaHeads Brasil. All rights reserved.
//

import UIKit
import Unbox

/**
 A venue from a Meetup.
 We need to authenticate our request in order to receive the venue
*/
class VenueModel: Unboxable {

    let country :String
    let city :String
    let address1 :String
    let name :String
    let lat :Double
    let lon :Double
    let venueId :Int
    let repinned :Bool
    
    required init(unboxer: Unboxer) {
        country = unboxer.unbox("country")
        city = unboxer.unbox("city")
        address1 = unboxer.unbox("address_1")
        name = unboxer.unbox("name")
        lat = unboxer.unbox("lat")
        lon = unboxer.unbox("lon")
        venueId = unboxer.unbox("id")
        repinned = unboxer.unbox("repinned")
    }
    
}
