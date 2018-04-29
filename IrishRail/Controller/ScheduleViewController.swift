//
//  ScheduleViewController.swift
//  IrishRail
//
//  Created by Bozhidar Gyorev on 27.04.18.
//  Copyright © 2018 Bozhidar Gyorev. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	@IBOutlet weak var scheduleTableView: UITableView!
	open var trains: [Dictionary<String, String?>]?
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		scheduleTableView.delegate = self
		scheduleTableView.dataSource = self
		if let trains = trains {
			if let first = trains.first {
				if let stationCode = first[Constants.xmlFields.stationCode.lowercased().capitalized] {
					self.navigationItem.title = stationCode!
				}
			}
		}
    }

	// MARK: UITableViewDataSource
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if let trains = trains {
			return trains.count
		}
		return 0
	}
	
	// MARK: UITableViewDelegate
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let trains = trains {
			let train = trains[indexPath.row]
			let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleCell") as! ScheduleTableViewCell
			cell.setupCell(withDictionary: train)
			return cell
		}
		return UITableViewCell()
	}

}
