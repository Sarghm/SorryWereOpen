//
//  SorryWereOpen.swift
//  
//
//  Created by Sam Piggott on 13/09/2015.
//
//

import UIKit

class SorryWereOpen {
    
    class func checkIfTime(date:NSDate!, isBetween firstDate:NSDate!, andTime lastDate:NSDate!) -> Bool? {
        let calendar = NSCalendar.currentCalendar()
        
        func groundDate(date:NSDate!) -> NSDate? {
            let components = calendar.components(.CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitSecond, fromDate: date)
            components.calendar = calendar
            return components.date
        }
        
        if var date1970 = groundDate(date), let firstDate1970 = groundDate(firstDate), var lastDate1970 = groundDate(lastDate) {
            if firstDate1970.compare(lastDate1970) == NSComparisonResult.OrderedDescending { lastDate1970 = lastDate1970.dateByAddingTimeInterval(86400)
                if date1970.compare(firstDate1970) == NSComparisonResult.OrderedAscending { date1970 = date1970.dateByAddingTimeInterval(86400) }
            }
            if date1970.compare(firstDate1970) == NSComparisonResult.OrderedAscending { return false }
            if date1970.compare(lastDate1970) == NSComparisonResult.OrderedDescending { return false }
            return true
        }
        return nil
    }
}

