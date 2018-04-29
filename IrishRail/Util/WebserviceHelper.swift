//
//  WebserviceHelper.swift
//  IrishRail
//
//  Created by Bozhidar Gyorev on 29.04.18.
//  Copyright © 2018 Bozhidar Gyorev. All rights reserved.
//

import Foundation
import CheatyXML

class WebserviceHelper: NSObject {
	open static let sharedInstance = WebserviceHelper()
	
	open func getAllStations(completion: (([Dictionary<String, String?>]) -> Void)) {
		if let url = URL(string: Constants.webLinks.getAllStations) {
			guard let stationsData = try? Data(contentsOf: url) else {
				return
			}
			
			var stations = [Dictionary<String, String?>]()
			if let parser = CXMLParser(data: stationsData) {
				for station in parser.rootElement.elementsNamed("objStation") {
					var elements = Dictionary<String, String?>()
					for element in station {
						elements[element.tagName] = element.string
					}
					stations.append(elements)
				}
				
				completion(stations)
			}
		}
	}
	
	open func getStationTrains(byCode stationCode: String, completion: (([Dictionary<String, String?>]) -> Void)) {
		if let url = URL(string: Constants.webLinks.getStationTrainsByCode+stationCode) {
			guard let stationData = try? Data(contentsOf: url) else {
				return
			}
			
			var trains = [Dictionary<String, String?>]()
			if let parser = CXMLParser(data: stationData) {
				for train in parser.rootElement {
					var elements = Dictionary<String, String?>()
					for element in train {
						elements[element.tagName] = element.string
					}
					trains.append(elements)
				}
			}
			completion(trains)
			
		}
	}
	
	open func getTrainStops(byCode trainCode: String, completion:(([Dictionary<String, String?>]) -> Void)) {
		let now = Date()
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "ddMMMyyyy"
		
		let urlString = Constants.webLinks.getTrainsStopsByCode.replacingOccurrences(of: "$1", with: trainCode.replacingOccurrences(of: " ", with: "")).replacingOccurrences(of: "$2", with: dateFormatter.string(from: now))
		
		if let url = URL(string: urlString) {
			guard let trainData = try? Data(contentsOf: url) else {
				return
			}
			
			var stops = [Dictionary<String, String?>]()
			if let parser = CXMLParser(data: trainData) {
				for stop in parser.rootElement.elementsNamed("objTrainMovements") {
					var elements = Dictionary<String, String?>()
					for element in stop {
						elements[element.tagName] = element.string
					}
					stops.append(elements)
				}
			}
			completion(stops)
		}
	}
}
