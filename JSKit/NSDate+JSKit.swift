//
//  NSDate+JSKit.swift
//  JSKit
//
//  Created by Giacomo Piva on 06/02/15.
//  Copyright (c) 2015 Giacomo Piva. All rights reserved.
//

import UIKit

extension Date {
    
    /**
     *  Create a new date from a string with a ISO format
     */
    static func dateFromISOString(_ isoDateString: String) -> Date? {
        return dateFromCustomFormatString(isoDateString, format: "yyyy-MM-dd HH:mm:ss")
    }
    
    /**
     *  Create a new date from a string with a custom format
     */
    static func dateFromCustomFormatString(_ dateString: String, format: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        if let date = formatter.date(from: dateString) {
            return formatter.date(from: formatter.string(from: date))!
        }
        
        return nil
    }
    
    /**
     *  Returns the date as a String in ISO format yyyy-MM-dd HH:mm:ss
     *  TODO: Refactory in a more elegant way ASAP
     */
    func ISOString() -> String {
        let year = self.year()
        let month = self.month()
        let day = self.day()
        let hour = self.hour()
        let min = self.minute()
        let sec = self.second()
        
        var date = "\(year)-"
        
        if (month < 10) {
            date += "0"
        }
        
        date += "\(month)-"
        
        if (day < 10) {
            date += "0"
        }
        
        date += "\(day) "

        if (hour < 10) {
            date += "0"
        }
        
        date += "\(hour):"

        if (min < 10) {
            date += "0"
        }
        
        date += "\(min):"

        if (sec < 10) {
            date += "0"
        }
        
        date += "\(sec)"
        
        return date
    }
    
    /**
     *  Returns the Year of the NSDate
     */
    func year() -> Int {
        let calendar = Calendar.current
        return (calendar as NSCalendar).components([.year], from: self).year!
    }
    
    /**
     *  Returns the Month of the NSDate
     */
    func month() -> Int {
        let calendar = Calendar.current
        return (calendar as NSCalendar).components([.month], from: self).month!
    }
    
    /**
     *  Returns the Day of the NSDate
     */
    func day() -> Int {
        let calendar = Calendar.current
        return (calendar as NSCalendar).components([.day], from: self).day!
    }
    
    /**
     *  Returns the Week day of the NSDate
     */
    func weekDay() -> Int {
        let calendar = Calendar.current
        return (calendar as NSCalendar).components([.weekday], from: self).weekday!
    }
    
    /**
     *  Returns the Hour of the NSDate
     */
    func hour() -> Int {
        let calendar = Calendar.current
        return (calendar as NSCalendar).components([.hour], from: self).hour!
    }

    /**
     *  Returns the Minutes of the NSDate
     */
    func minute() -> Int {
        let calendar = Calendar.current
        return (calendar as NSCalendar).components([.minute], from: self).minute!
    }

    /**
     *  Returns the Seconds of the NSDate
     */
    func second() -> Int {
        let calendar = Calendar.current
        return (calendar as NSCalendar).components([.second], from: self).second!
    }

    /**
     * I found this set of methods here:
     * http://stackoverflow.com/questions/27182023/getting-the-difference-between-two-nsdates-in-months-days-hours-minutes-seconds
     */
    
    /**
     *  A set of calculation on dates
     *  They returns how many yaers to seconds between the date and a date passed as argument
     */
    func yearsFrom(_ date:Date) -> Int {
        return (Calendar.current as NSCalendar).components([.year], from: date, to: self, options: NSCalendar.Options.init(rawValue: 0)).year!
    }
    
    func monthsFrom(_ date:Date) -> Int {
        return (Calendar.current as NSCalendar).components([.month], from: date, to: self, options: NSCalendar.Options.init(rawValue: 0)).month!
    }
    
    func weeksFrom(_ date:Date) -> Int {
        return (Calendar.current as NSCalendar).components([.weekOfYear], from: date, to: self, options: NSCalendar.Options.init(rawValue: 0)).weekOfYear!
    }
    
    func daysFrom(_ date:Date) -> Int {
        return (Calendar.current as NSCalendar).components([.day], from: date, to: self, options: NSCalendar.Options.init(rawValue: 0)).day!
    }
    
    func hoursFrom(_ date:Date) -> Int {
        return (Calendar.current as NSCalendar).components([.hour], from: date, to: self, options: NSCalendar.Options.init(rawValue: 0)).hour!
    }
    
    func minutesFrom(_ date:Date) -> Int {
        return (Calendar.current as NSCalendar).components([.minute], from: date, to: self, options: NSCalendar.Options.init(rawValue: 0)).minute!
    }
    
    func secondsFrom(_ date:Date) -> Int {
        return (Calendar.current as NSCalendar).components([.second], from: date, to: self, options: NSCalendar.Options.init(rawValue: 0)).second!
    }    
}
