//
//  URLSessionNetworkProviderMock.swift
//  BioWeatherTests
//
//  Created by Rafael Lima on 07/01/2023.
//

import Foundation

@testable import BioWeather

class URLSessionNetworkProviderMock: NetworkProvider {

    var forceError = false
    var didCallRequestData = false
    var endpointRequestURL = ""
    var reachability: ReachabilityType = ReachabilityMock()

    func requestData(from endpoint: Endpoint) async throws -> Data {
        self.didCallRequestData = true
        self.endpointRequestURL = endpoint.urlRequest().url!.absoluteString

        if forceError {
            throw ApiError.emptyData
        } else {
            return JSONHelper.getDataFrom(json: "current-weather")!
        }
    }
}
