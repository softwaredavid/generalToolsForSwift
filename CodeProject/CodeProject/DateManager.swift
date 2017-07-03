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
    //MARK: - 获取当前的天
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
        
        return Calendar.current.component(.weekday, from: date)
    }
    //MARK: - 每月的第一天是周几
    static func firstWeekInThisMonth(date: Date) -> (Int) {
        var calendar = Calendar.current
        calendar.firstWeekday = 1
        var com = calendar.dateComponents([.year,.month,.day], from: date)
        com.day = 1
        let da = calendar.date(from: com)
        let firstWeekDay = calendar.ordinality(of: .weekday, in: .month, for: da!)
        return firstWeekDay! - 1
    }

}
