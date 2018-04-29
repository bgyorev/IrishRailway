//
//  ScheduleTableViewCell.swift
//  IrishRail
//
//  Created by Bozhidar Gyorev on 27.04.18.
//  Copyright © 2018 Bozhidar Gyorev. All rights reserved.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {

	@IBOutlet weak var destinationLabel: UILabel!
	@IBOutlet weak var departureTimeLabel: UILabel!
	@IBOutlet weak var arrivalTimeLabel: UILabel!
	
	open func setupCell(withDictionary dict: Dictionary<String, String>) {
		destinationLabel.text = dict["Destination"]
		departureTimeLabel.text = dict["DepartureTime"]
		arrivalTimeLabel.text = dict["ArrivalTime"]
	}
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
