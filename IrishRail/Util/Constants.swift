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
		static let getStationTrainsByCode = "http://api.irishrail.ie/realtime/realtime.asmx/getStationDataByCodeXML?StationCode="
		static let getTrainsStopsByCode = "http://api.irishrail.ie/realtime/realtime.asmx/getTrainMovementsXML?TrainId=$1&TrainDate=$2"
	}
	
	struct xmlFields {
		static let stationAlias = "StationAlias"
		static let stationDescription = "StationDesc"
		static let stationCode = "StationCode"
		static let stationId = "StationId"
		static let origin = "Origin"
		static let destionation = "Destination"
		static let originTime = "Origintime"
		static let destinationTime = "Destinationtime"
		static let expectedArrival = "Exparrival"
		static let expectedDeparture = "Expdepart"
	}
}
