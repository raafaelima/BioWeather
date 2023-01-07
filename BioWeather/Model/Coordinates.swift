//
//  Coordinates.swift
//  BioWeather
//
//  Created by Rafael Lima on 07/01/2023.
//

import Foundation

struct Coordinates {
    let latitude: Double
    let longitude: Double

    func formmated() -> String {
        return "\(latitude),\(longitude)"
    }
}
