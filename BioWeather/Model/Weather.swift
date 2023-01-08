//
//  Weather.swift
//  BioWeather
//
//  Created by Rafael Lima on 07/01/2023.
//

import Foundation

struct Weather {
    let temperature: Int
    let feelsLike: Int
    let weatherCode: Int
    let windSpeed: Int
    let humidity: Int
    let descriptions: [String]

    static let noData = Weather(temperature: 0, feelsLike: 0, weatherCode: 113, windSpeed: 0, humidity: 0, descriptions: [])

    func temperatureWithIndicator() -> String {
        return "\(temperature)˚"
    }

    func weatherState() -> String {
        return descriptions.joined(separator: ", ")
    }
}

extension Weather: Codable {

    enum CodingKeys: String, CodingKey {
        case temperature
        case feelsLike = "feelslike"
        case weatherCode = "weather_code"
        case windSpeed = "wind_speed"
        case humidity
        case descriptions = "weather_descriptions"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        temperature = try values.decode(Int.self, forKey: .temperature)
        feelsLike = try values.decode(Int.self, forKey: .feelsLike)
        weatherCode = try values.decode(Int.self, forKey: .weatherCode)
        windSpeed = try values.decode(Int.self, forKey: .windSpeed)
        humidity = try values.decode(Int.self, forKey: .humidity)
        descriptions = try values.decode([String].self, forKey: .descriptions)
    }
}
