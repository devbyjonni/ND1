//
//  CalendarDate.swift
//  ND1
//
//  Created by Jonni Akesson on 2022-03-16.
//

import Foundation

class CalendarDate: Hashable, Equatable {
    var uuid = UUID()
    var date: Date
    var weekDay: String
    var progress: Double
    
    init(date: Date, weekDay: String, progress: Double) {
        self.date = date
        self.weekDay = weekDay
        self.progress = progress
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
    
    static func == (lhs: CalendarDate, rhs: CalendarDate) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
