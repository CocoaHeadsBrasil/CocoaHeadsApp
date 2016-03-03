//
//  MeetupModel.swift
//  CocoaHeadsApp
//
//  Created by Bruno Bilescky on 06/11/15.
//  Copyright © 2015 CocoaHeads Brasil. All rights reserved.
//

import UIKit
import Unbox

/**
 The Meetup response model
*/
class MeetupModel: Unboxable {

    let headCount :Int
    let visibility :String
    let waitlistCount :Int
    let meetDescription :String
    let howToFindUs :String?
    let eventURL :NSURL
    let yesRsvpCount :Int
    let maybeRsvpCount :Int
    let name :String
    let meetId :String
    let status :String
    let group :GroupModel
    let venue :VenueModel?
    let eventDate :NSDate
    let eventDateTempo :Tempo
    
    required init(unboxer: Unboxer) {
        headCount = unboxer.unbox("headcount")
        eventDate = unboxer.unbox("time")
        eventDateTempo = Tempo(date: eventDate)
        visibility = unboxer.unbox("visibility")
        waitlistCount = unboxer.unbox("waitlist_count")
        meetDescription = unboxer.unbox("description")
        howToFindUs = unboxer.unbox("how_to_find_us")
        eventURL = unboxer.unbox("event_url")
        yesRsvpCount = unboxer.unbox("yes_rsvp_count")
        maybeRsvpCount = unboxer.unbox("maybe_rsvp_count")
        name = unboxer.unbox("name")
        meetId = unboxer.unbox("id")
        status = unboxer.unbox("status")
        group = unboxer.unbox("group")
        venue = unboxer.unbox("venue")
    }
    
}
