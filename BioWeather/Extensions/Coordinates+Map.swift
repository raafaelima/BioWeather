//
//  Coordinates+Map.swift
//  BioWeather
//
//  Created by Rafael Lima on 07/01/2023.
//

import Foundation
import MapKit

extension Coordinates {
    static func from(_ mapCoordinates: CLLocation?) -> Self {
        if let mapCoordinates {
            return Self(latitude: mapCoordinates.coordinate.latitude, longitude: mapCoordinates.coordinate.longitude)
        } else {
            return Self(latitude: 0, longitude: 0)
        }
    }
}
