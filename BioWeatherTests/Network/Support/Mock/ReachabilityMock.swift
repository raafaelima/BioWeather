//
//  ReachabilityMock.swift
//  BioWeatherTests
//
//  Created by Rafael Lima on 07/01/2023.
//

import Foundation

@testable import BioWeather

class ReachabilityMock: ReachabilityType {

    var forceError: Bool = false
    var didCallStatus: Bool = false

    func currentStatus() -> ReachabilityStatus {
        didCallStatus = true
        return forceError ? .notReachable : .reachableViaWiFi
    }
}
