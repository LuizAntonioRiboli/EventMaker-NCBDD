//
//  DashboardTableViewCell.swift
//  EventMaker
//
//  Created by Annderson Packeiser Oreto on 03/09/19.
//  Copyright © 2019 Raul Rodrigues. All rights reserved.
//

import UIKit

class DashboardTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
