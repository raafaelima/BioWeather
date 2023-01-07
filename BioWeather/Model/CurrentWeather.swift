//
//  CurrentWeather.swift
//  BioWeather
//
//  Created by Rafael Lima on 07/01/2023.
//

import Foundation

struct CurrentWeather {
    let location: Location
    let weather: Weather

    static let noData = CurrentWeather(location: Location.noData, weather: Weather.noData)
}

extension CurrentWeather: Codable {

    enum CodingKeys: String, CodingKey {
        case location = "location"
        case weather = "current"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        location = try values.decode(Location.self, forKey: .location)
        weather = try values.decode(Weather.self, forKey: .weather)
    }
}
