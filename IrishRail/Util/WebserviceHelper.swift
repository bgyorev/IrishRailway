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
			guard let stationData = try? Data(contentsOf: url) else {
				return
			}
			
			var stations = [Dictionary<String, String?>]()
			let parser = CXMLParser(data: stationData)
			for station in (parser?.rootElement)!.elementsNamed("objStation") {
				var elements = Dictionary<String, String>()
				for element in station {
					elements[element.tagName] = element.string
				}
				stations.append(elements)
			}
			
			completion(stations)
		}
	}
}
