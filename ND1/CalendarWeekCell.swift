//
//  CalendarWeekCell.swift
//  ND1
//
//  Created by Jonni Akesson on 2022-03-16.
//

import UIKit

class CalendarWeekCell: UICollectionViewCell {
    
    @IBOutlet weak var weekDayLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weekDateBg: UIView!
    
    var calendarDate: CalendarDate? {
        didSet {
            if let calendarDate = calendarDate {
                weekDayLabel.text = calendarDate.weekDay
                //dateLabel.text = calendarDate.date
            }
        }
    }
}
