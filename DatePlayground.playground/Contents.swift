//: Playground - noun: a place where people can play

import UIKit

class TimeChecker {

class func checkIfTime(date:NSDate!, isBetween firstDate:NSDate!, andTime lastDate:NSDate!) -> Bool? {
    let calendar = NSCalendar.currentCalendar()
    
    func groundDate(date:NSDate!) -> NSDate? {
        let components = calendar.components(.CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitSecond, fromDate: date)
        components.calendar = calendar
        return components.date
    }
    
    if let date1970 = groundDate(date), let firstDate1970 = groundDate(firstDate), var lastDate1970 = groundDate(lastDate) {
        if firstDate1970.compare(lastDate1970) == NSComparisonResult.OrderedDescending { lastDate1970 = lastDate1970.dateByAddingTimeInterval(86400) }
        if date1970.compare(firstDate1970) == NSComparisonResult.OrderedAscending { return false }
        if date1970.compare(lastDate1970) == NSComparisonResult.OrderedDescending { return false }
        return true
    }
    return nil
    }
}

let calendar = NSCalendar.currentCalendar()
let todaysDate = NSDate()

// Have a bunch of preconfigured dates.
let threeInTheMorning = NSDateComponents(); threeInTheMorning.calendar = calendar
threeInTheMorning.hour = 3; threeInTheMorning.minute = 0; threeInTheMorning.second = 0;

let nineInTheMorning = NSDateComponents(); nineInTheMorning.calendar = calendar
nineInTheMorning.hour = 9; nineInTheMorning.minute = 0; nineInTheMorning.second = 0;

let elevenInTheMorning = NSDateComponents(); elevenInTheMorning.calendar = calendar
elevenInTheMorning.hour = 11; elevenInTheMorning.minute = 0; elevenInTheMorning.second = 0;

let sixAtNight = NSDateComponents(); sixAtNight.calendar = calendar
sixAtNight.hour = 18; sixAtNight.minute = 0; sixAtNight.second = 0;

// And here's the li'l fella in action.
TimeChecker.checkIfTime(todaysDate, isBetween: elevenInTheMorning.date, andTime: threeInTheMorning.date)