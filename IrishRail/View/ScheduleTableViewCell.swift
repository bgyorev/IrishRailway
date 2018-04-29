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
		originLabel.text = dict[Constants.xmlFields.origin] != nil ? dict[Constants.xmlFields.origin]! : ""
		destinationLabel.text = dict[Constants.xmlFields.destionation] != nil ? dict[Constants.xmlFields.destionation]! : ""
		departureTimeLabel.text = dict[Constants.xmlFields.originTime] != nil ? dict[Constants.xmlFields.originTime]! : ""
		arrivalTimeLabel.text = dict[Constants.xmlFields.destinationTime] != nil ? dict[Constants.xmlFields.destinationTime]! : ""
		expectedArrivalTimeLabel.text = dict[Constants.xmlFields.expectedArrival] != nil ? dict[Constants.xmlFields.expectedArrival]! : ""
		expectedDepartureTimeLabel.text = dict[Constants.xmlFields.expectedDeparture] != nil ? dict[Constants.xmlFields.expectedDeparture]! : ""
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
