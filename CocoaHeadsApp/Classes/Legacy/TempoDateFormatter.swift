//
//  TempoDateFormatter.swift
//  CocoaHeadsApp
//
//  Created by Igor Fereira on 01/03/2016.
//  Copyright © 2016 CocoaHeads Brasil. All rights reserved.
//

import Foundation

class TempoDateFormatter {
    
    var dateFormatter: NSDateFormatter!
    var calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
    
    private(set) static var sharedInstance: TempoDateFormatter = {
        let instance = TempoDateFormatter()
        instance.dateFormatter = NSDateFormatter()
        instance.dateFormatter.locale = NSLocale.autoupdatingCurrentLocale()
        instance.dateFormatter.timeZone = NSTimeZone.defaultTimeZone()
        return instance
    }()
}