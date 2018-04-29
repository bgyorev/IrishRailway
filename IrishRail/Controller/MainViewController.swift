//
//  ViewController.swift
//  IrishRail
//
//  Created by Bozhidar Gyorev on 27.04.18.
//  Copyright © 2018 Bozhidar Gyorev. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

	@IBOutlet weak var checkTrainButton: UIButton!
	@IBOutlet weak var stationTextField: UITextField!
	
	private let picker = UIPickerView()
	
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

	// MARK: Private methods
	@objc
	private func doneButtonPressed() {
		stationTextField.resignFirstResponder()
	}
	
	@objc
	private func cancelButtonPressed() {
		self.doneButtonPressed()
		stationTextField.text = ""
	}
	
	// MARK: UIPickerViewDataSource
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return 0
	}
	
	// MARK: UIPickerViewDelegate
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return ""
	}
	
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		
	}
	
	// MARK: IBActions
	@IBAction func checkTrainButtonPressed(_ sender: Any) {
	}
	
}

