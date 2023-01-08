//
//  SummyEndpoint.swift
//  BioWeatherTests
//
//  Created by Rafael Lima on 07/01/2023.
//

import Foundation
@testable import BioWeather

struct DummyEndpoint: Endpoint {
    var path: EndpointPath = .currentWeather
    var params: [URLQueryItem] = []
}
