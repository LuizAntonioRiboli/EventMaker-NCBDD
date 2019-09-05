//
//  DashboardTableViewCell.swift
//  EventMaker
//
//  Created by Annderson Packeiser Oreto on 03/09/19.
//  Copyright © 2019 Raul Rodrigues. All rights reserved.
//

import UIKit

class DashboardTableViewCell: UITableViewCell {
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var participatingButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        eventImageView.layer.cornerRadius = eventImageView.frame.height/2
        participatingButton.layer.borderWidth = 1
        participatingButton.layer.borderColor = UIColor.green.cgColor
        participatingButton.layer.cornerRadius = participatingButton.frame.height/4
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
