//
//  DateManager.swift
//  CodeProject
//
//  Created by Apple on 2017/7/3.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//

import UIKit

class DateManager: NSObject {
    
    //MARK: - 获取当前的年
    static func getYearFromDate(date: Date) -> Int {
        
        return Calendar.current.component(.year, from: date)
    }
    //MARK: - 获取当前的月
    static func getMonthFromDate(date: Date) -> Int {
        
        return Calendar.current.component(.month, from: date)
    }
    //MARK: - 获取当前的日
    static func getDayFromDate(date: Date) -> Int {
        
        return Calendar.current.component(.day, from: date)
    }
    //MARK: - 获取当前的小时
    static func getHoursFromDate(date: Date) -> Int {
        
        return Calendar.current.component(.hour, from: date)
    }
    //MARK: - 获取当前的分钟
    static func getMinuteFromDate(date: Date) -> Int {
        
        return Calendar.current.component(.minute, from: date)
    }
    //MARK: - 获取当前的秒
    static func getSecondFromDate(date: Date) -> Int {
        
        return Calendar.current.component(.second, from: date)
    }
    //MARK: - 获取当前的周
    static func getWeekFromDate(date: Date) -> Int {
        
        var week = -1
        let w = Calendar.current.component(.weekday, from: date)
        switch w {
        case 1: week = 7
        case 2: week = 1
        case 3: week = 2
        case 4: week = 3
        case 5: week = 4
        case 6: week = 5
        case 7: week = 6
        default: week = -1
        }
        return week
    }
    
    //返回一个时间的Components
    static func getComponents(date: Date) -> DateComponents {
        
        let calendar = Calendar.current
        return calendar.dateComponents([.year,.month,.weekday,.day,.hour,.minute,.second], from: date)
    }
    
    //MARK: - 每月的第一天是周几
    static func firstWeekInTheMonth(date: Date) -> Int {
        var calendar = Calendar.current
        calendar.firstWeekday = 1
        var com = calendar.dateComponents([.year,.month,.day], from: date)
        com.day = 1
        let da = calendar.date(from: com)
        let firstWeekDay = getWeekFromDate(date: da!)
        return firstWeekDay
    }
    
    // MARK: - 获取每月有几周
    static func getNumOfWeekInMonth(date: Date) -> Int {
        
        let calendar = Calendar.current
        return calendar.range(of: .weekOfMonth, in: .month, for: date)?.count ?? -1
        
    }
    
    // MARK: - 获取每月有几天
    static func getNumOfDaysInMonth(date: Date) -> Int {
        
        let calendar = Calendar.current
        return calendar.range(of: .day, in: .month, for: date)?.count ?? -1
        
    }
    
    // MARK: - 获取当前时间之后的时间
    static func getAfterDate(date: Date,year: Int?=0, month: Int?=0, week: Int?=0,day: Int?=0,hour: Int?=0, minute: Int?=0,second: Int?=0) -> Date? {
        let calendar = Calendar.current
        var com = calendar.dateComponents([.year,.month,.weekday,.day,.hour,.minute,.second], from: date)
        com.year! += year!
        com.month! += month!
        com.weekday! += week!
        com.day! += day!
        com.hour! += hour!
        com.minute! += minute!
        com.second! += second!
        return calendar.date(from: com)
    }
    
    // MARK: --- 把一个字符串转换为时间 格式为 yyyy-MM-dd HH:mm:ss
    static func getDateFrom(dateString: String?) -> Date? {
        
        guard let _ = dateString else { return nil }
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormater.date(from: dateString!)
        
    }
    
    // MARK: --- 把一个日期转换为字符串 传入格式
    static func getStringFrom(date: Date, formatter: String!) -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = formatter
        return dateFormater.string(from: date)
    }
    
    // MARK: --- 得到两个时间之间的时间差返回秒
    static func getTimeInterval(date1: Date, date2: Date) -> Int {
        
        return Int(date1.timeIntervalSince(date2)) + 1 //时间差少一秒
        
    }
    
}
