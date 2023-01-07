//
//  Location.swift
//  BioWeather
//
//  Created by Rafael Lima on 07/01/2023.
//

import Foundation

struct Location {

    let name: String
    let country: String
    let region: String
    let latitude: Double
    let longitude: Double

    static var noData: Location = Location(name: "", country: "", region: "", latitude: 0.0, longitude: 0.0)

    func description() -> String {
        return "\(region), \(country)"
    }
}

extension Location: Codable {

    enum CodingKeys: String, CodingKey {
        case name
        case country
        case region
        case latitude = "lat"
        case longitude = "lon"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        country = try values.decode(String.self, forKey: .country)
        region = try values.decode(String.self, forKey: .region)
        latitude = Double(try values.decode(String.self, forKey: .latitude)) ?? 0
        longitude = Double(try values.decode(String.self, forKey: .longitude)) ?? 0
    }
}
