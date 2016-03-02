//
//  Tempo.swift
//  CocoaHeadsApp
//
//  Created by Bruno Bilescky on 06/11/15.
//  Copyright © 2015 CocoaHeads Brasil. All rights reserved.
//

import Foundation
import ObjectiveC

/**
 Tempo is a better way to handle dates
*/
class Tempo {
    private var _years: Int!
    private var _months: Int!
    private var _days: Int!
    private var _hours: Int!
    private var _minutes: Int!
    private var _seconds: Int!
    private var _date: NSDate!
    private var _locale: NSLocale!
    private var _timeZone: NSTimeZone!
    
    var timeZone: NSTimeZone! {
        get {
            return self._timeZone
        }
        set {
            self._timeZone = newValue
            if self.timeZone != nil {
                TempoDateFormatter.sharedInstance.dateFormatter.timeZone = self.timeZone
                self.updateDate()
                self.updateComponents()
            }
        }
    }
    
    var locale: NSLocale! {
        get {
            return self._locale
        }
        set {
            self._locale = newValue
            if self.locale != nil {
                TempoDateFormatter.sharedInstance.dateFormatter.locale = self.locale
                self.updateDate()
                self.updateComponents()
            }
        }
    }
    
    var years: Int! {
        get {
            return self._years
        }
        set {
            self._years = newValue
            self.updateDate()
        }
    }
    var months: Int! {
        get {
            return self._months
        }
        set {
            self._months = newValue
            self.updateDate()
        }
    }
    var days: Int! {
        get {
            return self._days
        }
        set {
            self._days = newValue
            self.updateDate()
        }
    }
    var hours: Int! {
        get {
            return self._hours
        }
        set {
            self._hours = newValue
            self.updateDate()
        }
    }
    var minutes: Int! {
        get {
            return self._minutes
        }
        set {
            self._minutes = newValue
            self.updateDate()
        }
    }
    var seconds: Int! {
        get {
            return self._seconds
        }
        set {
            self._seconds = newValue
            self.updateDate()
        }
    }
    var date: NSDate! {
        get {
            return self._date
        }
        set {
            self._date = newValue
            self.updateComponents()
        }
    }
    
    typealias DateFormatBuilder = (newTemp:Tempo) -> ()
    
    private func updateDate() {
        
        let dateComponents = TempoDateFormatter.sharedInstance.calendar!.components(NSCalendarUnit.WeekdayOrdinal, fromDate: NSDate())
        
        dateComponents.year = self.years
        dateComponents.month = self.months
        dateComponents.day = self.days
        dateComponents.hour = self.hours
        dateComponents.minute = self.minutes
        dateComponents.second = self.seconds
        self.date = TempoDateFormatter.sharedInstance.calendar?.dateFromComponents(dateComponents)
    }
    
    private func updateComponents() {
        let dateComponents = TempoDateFormatter.sharedInstance.calendar!.components([NSCalendarUnit.Year,
            NSCalendarUnit.Month, NSCalendarUnit.Day,
            NSCalendarUnit.Hour, NSCalendarUnit.Minute,
            NSCalendarUnit.Second], fromDate: self._date)
        
        logger.verbose("y = \(dateComponents.year)")
        self._years = dateComponents.year
        self._months = dateComponents.month
        self._days = dateComponents.day
        self._hours = dateComponents.hour
        self._minutes = dateComponents.minute
        self._seconds = dateComponents.second
    }
    
    init() {
        self._locale = NSLocale.autoupdatingCurrentLocale()
        self._date = NSDate()
        self.updateComponents()
    }
    
    convenience init(stringDate: String, timeLocale: NSLocale = NSLocale.autoupdatingCurrentLocale(),
        timeZone: NSTimeZone = NSTimeZone.defaultTimeZone()) {
            self.init()
            
            let dateFormats = [
                "yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'",
                "yyyy-MM-dd",
                "h:mm:ss A",
                "h:mm A",
                "dd/MM/yyyy",
                "MM/dd/yyyy",
                "MMMM d, yyyy",
                "MMMM d, yyyy LT",
                "dddd, MMMM D, yyyy LT",
                "yyyyyy-MM-dd",
                "yyyy-MM-dd",
                "GGGG-[W]WW-E",
                "GGGG-[W]WW",
                "yyyy-ddd",
                "HH:mm:ss.SSSS",
                "HH:mm:ss",
                "HH:mm",
                "HH"
            ]
            
            for currentDateFormat in dateFormats {
                TempoDateFormatter.sharedInstance.dateFormatter.dateFormat = currentDateFormat
                if let date = TempoDateFormatter.sharedInstance.dateFormatter.dateFromString(stringDate) {
                    
                    let dateComponents = TempoDateFormatter.sharedInstance.calendar!.components([NSCalendarUnit.Year,
                        NSCalendarUnit.Month, NSCalendarUnit.Day,
                        NSCalendarUnit.Hour, NSCalendarUnit.Minute,
                        NSCalendarUnit.Second], fromDate: date)
                    
                    self._years = dateComponents.year
                    self._months = dateComponents.month
                    self._days = dateComponents.day
                    self._hours = dateComponents.hour
                    self._minutes = dateComponents.minute
                    self._seconds = dateComponents.second
                    self._date = TempoDateFormatter.sharedInstance.calendar!.dateFromComponents(dateComponents)
                }
            }
    }
    
    convenience init(stringDate: String, format: String,
        timeLocale: NSLocale = NSLocale.autoupdatingCurrentLocale(),
        timeZone: NSTimeZone = NSTimeZone.defaultTimeZone()) {
            self.init()
            
            TempoDateFormatter.sharedInstance.dateFormatter.dateFormat = format
            if let date = TempoDateFormatter.sharedInstance.dateFormatter.dateFromString(stringDate) {
                
                let dateComponents = TempoDateFormatter.sharedInstance.calendar!.components([NSCalendarUnit.Year,
                    NSCalendarUnit.Month, NSCalendarUnit.Day,
                    NSCalendarUnit.Hour, NSCalendarUnit.Minute,
                    NSCalendarUnit.Second], fromDate: date)
                
                self._years = dateComponents.year
                self._months = dateComponents.month
                self._days = dateComponents.day
                self._hours = dateComponents.hour
                self._minutes = dateComponents.minute
                self._seconds = dateComponents.second
                self._date = TempoDateFormatter.sharedInstance.calendar!.dateFromComponents(dateComponents)
            }
    }
    
    convenience init(date: NSDate) {
        self.init()
        _date = date
        updateComponents()
    }
    
    convenience init(unixOffset: Double) {
        self.init()
        _date = NSDate(timeIntervalSince1970: unixOffset)
        updateComponents()
    }
    
    convenience init(buildClosure: DateFormatBuilder) {
        self.init()
        buildClosure(newTemp: self)
        self.updateComponents()
        self.updateDate()
    }
}

extension Tempo: CustomStringConvertible {
    
    /**
     Get the Tempo date to a string format easy to read.
     
     - parameter format: The format, you want to display, by default, it's : YYYY-MM-DD HH:mm.
     - returns: Formatted date String
     */
    func format(format: String = "YYYY-MM-DD HH:mm") -> String? {
        return self.format([format])
    }
    
    /**
     Get the Tempo date to a string format easy to read.
     
     - parameter formats: It's a list of format, user it, if you don't know which format is your date.
     - returns: Formatted date String
     */
    func format(formats: [String]) -> String! {
        for currentFormat in formats {
            TempoDateFormatter.sharedInstance.dateFormatter.dateFormat = currentFormat
            
            let dateString = TempoDateFormatter.sharedInstance.dateFormatter.stringFromDate(_date)
            if let _ = TempoDateFormatter.sharedInstance.dateFormatter.dateFromString(dateString) {
                return dateString
            }
        }
        return nil
    }
    
    internal var description: String {
        return format()!
    }
}

extension Tempo: CustomDebugStringConvertible {
    internal var debugDescription: String {
        return description
    }
}