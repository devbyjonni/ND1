//
//  Task.swift
//  ND1
//
//  Created by Jonni Akesson on 2022-03-16.
//

import Foundation

class Task: Hashable, Equatable {
    var uuid = UUID()
    var title: String
    var description: String
    var time: Double
    var progress: Double
    var completed: Bool
    
    init(title: String, description: String, time: Double, progress: Double, completed: Bool) {
        self.title = title
        self.description = description
        self.time = time
        self.progress = progress
        self.completed = completed
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
    
    static func == (lhs: Task, rhs: Task) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
