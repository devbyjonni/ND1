//
//  MainModel.swift
//  ND1
//
//  Created by Jonni Akesson on 2022-03-16.
//

import Foundation

class MainModel {
    
    var data: [Task] = [] {
        didSet {
            NotificationCenter.default.post(name: .didAddData, object: nil)
        }
    }
    
    var dates: [CalendarDate] = [] {
        didSet {
            NotificationCenter.default.post(name: .didAddDates, object: nil)
        }
    }
    
    func preloadData() {
        var tempData = [Task]()
        tempData.append(Task(title: "Workout", description: "Some description", time: 30, progress: 100))
        tempData.append(Task(title: "Meditate", description: "Some description", time: 30, progress: 100))
        tempData.append(Task(title: "Code lessons", description: "Some description", time: 30, progress: 100))
        tempData.append(Task(title: "Medicin", description: "Some description", time: 30, progress: 100))
        data = tempData
    }
    
    func preloadCalendarDates() {
        var tempData = [CalendarDate]()
        tempData.append(CalendarDate(date: Date(), weekDay: "mon", progress: 100))
        tempData.append(CalendarDate(date: Date(), weekDay: "tuw", progress: 100))
        tempData.append(CalendarDate(date: Date(), weekDay: "wed", progress: 100))
        tempData.append(CalendarDate(date: Date(), weekDay: "thu", progress: 100))
        tempData.append(CalendarDate(date: Date(), weekDay: "fri", progress: 100))
        tempData.append(CalendarDate(date: Date(), weekDay: "sat", progress: 100))
        tempData.append(CalendarDate(date: Date(), weekDay: "sun", progress: 100))
        
        tempData.append(CalendarDate(date: Date(), weekDay: "mon", progress: 100))
        tempData.append(CalendarDate(date: Date(), weekDay: "tuw", progress: 100))
        tempData.append(CalendarDate(date: Date(), weekDay: "wed", progress: 100))
        tempData.append(CalendarDate(date: Date(), weekDay: "thu", progress: 100))
        tempData.append(CalendarDate(date: Date(), weekDay: "fri", progress: 100))
        tempData.append(CalendarDate(date: Date(), weekDay: "sat", progress: 100))
        tempData.append(CalendarDate(date: Date(), weekDay: "sun", progress: 100))
        
        
        dates = tempData
    }
}
