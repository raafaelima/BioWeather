//
//  CurrentWeatherEndpoint.swift
//  BioWeather
//
//  Created by Rafael Lima on 07/01/2023.
//

import Foundation
import MapKit

struct CurrentWeatherEndpoint: Endpoint {
    var path: String = "/current"
    var params: [URLQueryItem] = []

    init(location: Coordinates) {
        self.params = [
            URLQueryItem(name: "query", value: location.formmated())
        ]
    }
}
