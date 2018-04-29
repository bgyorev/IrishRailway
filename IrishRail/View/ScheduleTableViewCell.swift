//
//  ScheduleTableViewCell.swift
//  IrishRail
//
//  Created by Bozhidar Gyorev on 27.04.18.
//  Copyright © 2018 Bozhidar Gyorev. All rights reserved.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {

	@IBOutlet weak var originLabel: UILabel!
	@IBOutlet weak var destinationLabel: UILabel!
	@IBOutlet weak var departureTimeLabel: UILabel!
	@IBOutlet weak var arrivalTimeLabel: UILabel!
	@IBOutlet weak var expectedArrivalTimeLabel: UILabel!
	@IBOutlet weak var expectedDepartureTimeLabel: UILabel!
	
	open func setupCell(withDictionary dict: Dictionary<String, String?>) {
		originLabel.text = dict["Origin"] != nil ? dict["Origin"]! : ""
		destinationLabel.text = dict["Destination"] != nil ? dict["Destination"]! : ""
		departureTimeLabel.text = dict["Origintime"] != nil ? dict["Origintime"]! : ""
		arrivalTimeLabel.text = dict["Destinationtime"] != nil ? dict["Destinationtime"]! : ""
		expectedArrivalTimeLabel.text = dict["Exparrival"] != nil ? dict["Exparrival"]! : ""
		expectedDepartureTimeLabel.text = dict["Expdepart"] != nil ? dict["Expdepart"]! : ""
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
