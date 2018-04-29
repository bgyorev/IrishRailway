//
//  StopsViewController.swift
//  IrishRail
//
//  Created by Bozhidar Gyorev on 29.04.18.
//  Copyright © 2018 Bozhidar Gyorev. All rights reserved.
//

import UIKit

class StopsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	@IBOutlet weak var stopsTableView: UITableView!
	
	open var stops:[Dictionary<String, String?>]?
	
	override func viewDidLoad() {
        super.viewDidLoad()

        stopsTableView.delegate = self
		stopsTableView.dataSource = self
    }

	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if let stops = stops {
			return stops.count
		}
		return 0
	}
	
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
