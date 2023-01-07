//
//  SummyEndpoint.swift
//  BioWeatherTests
//
//  Created by Rafael Lima on 07/01/2023.
//

import Foundation
@testable import BioWeather

struct DummyEndpoint: Endpoint {
    var path: String = "/dummy"
    var params: [URLQueryItem] = []
}
