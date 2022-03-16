//
//  TaskCell.swift
//  ND1
//
//  Created by Jonni Akesson on 2022-03-16.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var progressBarView: UIView!
    @IBOutlet weak var checkmarkView: UIView!
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        checkmarkView.layer.cornerRadius = (self.checkmarkView.frame.size.width) / 2
        checkmarkView.layer.borderWidth = 1
       
    }

    
    var task: Task? {
        didSet {
            layoutIfNeeded()
            if let task = task {
                titleLabel.text = task.title
                descriptionLabel.text = task.description
                
                if task.completed {
                    titleLabel.textColor = .systemGray3
                    timeLabel.textColor = .systemGray3
                    descriptionLabel.textColor = .systemGray3
                    progressBarView.backgroundColor = .systemGray3
                    checkmarkView.layer.borderColor = UIColor.systemGreen.cgColor
                    checkmarkView.layer.backgroundColor = UIColor.systemGreen.cgColor
                   
                } else {
                    checkmarkView.layer.borderColor = UIColor.label.cgColor
                }
            }
        }
    }
}
