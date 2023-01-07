//
//  Coordinates+Map.swift
//  BioWeather
//
//  Created by Rafael Lima on 07/01/2023.
//

import Foundation
import MapKit

extension Coordinates {
    func from(mapCoordinates: CLLocationCoordinate2D) -> Self {
        return Self(latitude: mapCoordinates.latitude, longitude: mapCoordinates.longitude)
    }
}
