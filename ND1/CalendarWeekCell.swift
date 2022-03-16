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
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        weekDateBg.layer.cornerRadius = (self.weekDateBg.frame.size.width) / 2
        weekDateBg.layer.borderWidth = 1
        weekDateBg.layer.borderColor = UIColor.gray.cgColor
    }
    
    var calendarDate: CalendarDate? {
        didSet {
            layoutIfNeeded()
            if let calendarDate = calendarDate {
                weekDayLabel.text = calendarDate.weekDay.uppercased()
                //dateLabel.text = calendarDate.date
                
                if calendarDate.weekDay == "thu" {
                    weekDateBg.layer.borderColor = UIColor.label.cgColor
                    weekDateBg.layer.backgroundColor = UIColor.label.cgColor
                    dateLabel.textColor = .black
                }
            }
        }
    }
}
