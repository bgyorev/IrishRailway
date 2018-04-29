//
//  StopsViewController.swift
//  IrishRail
//
//  Created by Bozhidar Gyorev on 29.04.18.
//  Copyright © 2018 Bozhidar Gyorev. All rights reserved.
//

import UIKit

class StopsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	// IBOutlets and views
	@IBOutlet weak var stopsTableView: UITableView!
	
	// Controller properties
	open var stops:[Dictionary<String, String?>]?
	
	override func viewDidLoad() {
        super.viewDidLoad()

        stopsTableView.delegate = self
		stopsTableView.dataSource = self
    }

	// MARK: UITableViewDataSource
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if let stops = stops {
			return stops.count
		}
		return 0
	}
	
	// MARK: UITableViewDelegate
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let stops = stops {
			let cell = tableView.dequeueReusableCell(withIdentifier: "stopCell")!
			let stop = stops[indexPath.row]
			cell.textLabel?.text = "\(stop["LocationFullName"]!!)(\(stop["LocationCode"]!!))"
			cell.detailTextLabel?.text = stop["ScheduledArrival"] ?? ""
			return cell
		}
		return UITableViewCell()
	}
	
}
