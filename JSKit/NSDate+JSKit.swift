//
//  NSDate+JSKit.swift
//  JSKit
//
//  Created by Giacomo Piva on 06/02/15.
//

import UIKit

extension NSDate {
    
   /**
    *  Create a new date from a string with a ISO format
    */
    static func dateFromISOString(isoDateString: String) -> NSDate? {
        return dateFromCustomFormatString(isoDateString, format: "yyyy-MM-dd HH:mm:ss")
    }
   
   /**
    *  Create a new date from a string with a custom format
    */
    static func dateFromCustomFormatString(dateString: String, format: String) -> NSDate? {
        let formatter = NSDateFormatter()
        formatter.dateFormat = format
        //formatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)
        formatter.timeZone = NSTimeZone()
        if let date = formatter.dateFromString(dateString) {
            return formatter.dateFromString(formatter.stringFromDate(date))!
        }
        
        return nil
    }

    /**
     *  Returns the Year of the NSDate
     */
    func year() -> Int {
        let calendar = NSCalendar.currentCalendar()
        return calendar.components([.Year], fromDate: self).year
    }
	
    /**
     *  Returns the Month of the NSDate
     */
    func month() -> Int {
        let calendar = NSCalendar.currentCalendar()
        return calendar.components([.Month], fromDate: self).month
    }
	
    /**
     *  Returns the Day of the NSDate
     */
    func day() -> Int {
        let calendar = NSCalendar.currentCalendar()
        return calendar.components([.Day], fromDate: self).day
    }
	
    /**
     *  Returns the Week day of the NSDate
     */
    func weekDay() -> Int {
        let calendar = NSCalendar.currentCalendar()
        return calendar.components([.Weekday], fromDate: self).weekday
    }

    /**
     * I found this set of methods here:
     * http://stackoverflow.com/questions/27182023/getting-the-difference-between-two-nsdates-in-months-days-hours-minutes-seconds
     */

    /**
     *  A set of calculation on dates
	 *  They returns how many yaers to seconds between the date and a date passed as argument
     */
    func yearsFrom(date:NSDate) -> Int {
        return NSCalendar.currentCalendar().components([.Year], fromDate: date, toDate: self, options: NSCalendarOptions.init(rawValue: 0)).year
    }
    
    func monthsFrom(date:NSDate) -> Int {
        return NSCalendar.currentCalendar().components([.Month], fromDate: date, toDate: self, options: NSCalendarOptions.init(rawValue: 0)).month
    }
    
    func weeksFrom(date:NSDate) -> Int {
        return NSCalendar.currentCalendar().components([.WeekOfYear], fromDate: date, toDate: self, options: NSCalendarOptions.init(rawValue: 0)).weekOfYear
    }
    
    func daysFrom(date:NSDate) -> Int {
        return NSCalendar.currentCalendar().components([.Day], fromDate: date, toDate: self, options: NSCalendarOptions.init(rawValue: 0)).day
    }
    
    func hoursFrom(date:NSDate) -> Int {
        return NSCalendar.currentCalendar().components([.Hour], fromDate: date, toDate: self, options: NSCalendarOptions.init(rawValue: 0)).hour
    }
    
    func minutesFrom(date:NSDate) -> Int {
        return NSCalendar.currentCalendar().components([.Minute], fromDate: date, toDate: self, options: NSCalendarOptions.init(rawValue: 0)).minute
    }
    
    func secondsFrom(date:NSDate) -> Int {
        return NSCalendar.currentCalendar().components([.Second], fromDate: date, toDate: self, options: NSCalendarOptions.init(rawValue: 0)).second
    }    
}
