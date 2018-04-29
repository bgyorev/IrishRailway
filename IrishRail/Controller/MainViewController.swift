//
//  ViewController.swift
//  IrishRail
//
//  Created by Bozhidar Gyorev on 27.04.18.
//  Copyright © 2018 Bozhidar Gyorev. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

	// IBOutlets and views
	@IBOutlet weak var checkTrainButton: UIButton!
	@IBOutlet weak var stationTextField: UITextField!
	
	private let picker = UIPickerView()
	
	// Controller properties
	private let webserviceHelper = WebserviceHelper.sharedInstance
	private var stations = [Dictionary<String, String?>]()
	private var selectedStation: Dictionary<String, String?>?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		picker.delegate = self
		picker.dataSource = self
		stationTextField.inputView = picker
		
		let toolbar = UIToolbar()
		toolbar.barStyle = .default
		toolbar.isTranslucent = true
		toolbar.isUserInteractionEnabled = true
		toolbar.sizeToFit()
		
		let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonPressed))
		let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
		let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonPressed))
		toolbar.setItems([cancelButton, space, doneButton], animated: false)

		stationTextField.inputAccessoryView = toolbar
		
	}
	
	override func viewWillAppear(_ animated: Bool) {
		webserviceHelper.getAllStations { (stations) in
			guard stations.count != 0 else {
				self.showAlert(withTitle: "Stations error", message: "Application couldn't fetch railway stations list")
				return
			}

			self.stations = stations.sorted(by: { (station1, station2) -> Bool in
				if let s1 = station1[Constants.xmlFields.stationDescription], let s2 = station2[Constants.xmlFields.stationDescription] {
					if let s1 = s1, let s2 = s2 {
						return s1 < s2
					}
				}
				return false
			})
			picker.reloadComponent(0)
		}
		
	}

	// MARK: Private methods
	@objc
	private func doneButtonPressed() {
		stationTextField.resignFirstResponder()
	}
	
	@objc
	private func cancelButtonPressed() {
		self.doneButtonPressed()
		selectedStation = nil
		stationTextField.text = ""
	}
	
	// MARK: UIPickerViewDataSource
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return stations.count
	}
	
	// MARK: UIPickerViewDelegate
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		if stations.count != 0 {
			let row = stations[row]
			if let stationDescription = row[Constants.xmlFields.stationDescription], let stationCode = row[Constants.xmlFields.stationCode] {
				if let stationDescription = stationDescription, let stationCode = stationCode {
					return "\(stationDescription)(\(stationCode))"
				}
				
			}
		}
		return ""
	}
	
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		if stations.count != 0 {
			let row = stations[row]
			if let stationDescription = row[Constants.xmlFields.stationDescription], let stationCode = row[Constants.xmlFields.stationCode] {
				if let stationDescription = stationDescription, let stationCode = stationCode {
					self.stationTextField.text = "\(stationDescription)(\(stationCode))"
					self.selectedStation = row
				}
				
			}
		}
	}
	
	// MARK: IBActions
	@IBAction func checkTrainButtonPressed(_ sender: Any) {
		if let selectedStation = self.selectedStation, let stationCodeOptional = selectedStation[Constants.xmlFields.stationCode], let stationCode = stationCodeOptional {
			webserviceHelper.getStationTrains(byCode: stationCode) { (trains) in
				let scheduleVC = self.storyboard?.instantiateViewController(withIdentifier: "ScheduleVC") as! ScheduleViewController
				scheduleVC.trains = trains
	
				self.navigationController?.pushViewController(scheduleVC, animated: true)
			}
		}
	}
	
}

