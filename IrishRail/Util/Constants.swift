//
//  Constants.swift
//  IrishRail
//
//  Created by Bozhidar Gyorev on 29.04.18.
//  Copyright © 2018 Bozhidar Gyorev. All rights reserved.
//

import Foundation

struct Constants {
	struct webLinks {
		static let getAllStations = "http://api.irishrail.ie/realtime/realtime.asmx/getAllStationsXML"
	}
	
	struct xmlFields {
		static let stationAlias = "StationAlias"
		static let stationDescription = "StationDesc"
		static let stationCode = "StationCode"
		static let stationId = "StationId"
	}
}
