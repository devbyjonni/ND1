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
    @IBOutlet weak var checkmarkBtn: UIButton!
    @IBOutlet weak var progressBarView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var task: Task? {
        didSet {
            if let task = task {
                titleLabel.text = task.title
                descriptionLabel.text = task.description
            }
        }
    }
}
