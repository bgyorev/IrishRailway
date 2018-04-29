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
	
	override func viewDidLoad() {
        super.viewDidLoad()

        stopsTableView.delegate = self
		stopsTableView.dataSource = self
    }

	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return UITableViewCell()
	}
	
}
