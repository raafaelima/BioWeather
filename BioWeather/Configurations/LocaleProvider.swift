//
//  LocaleProvider.swift
//  BioWeather
//
//  Created by Rafael Lima on 07/01/2023.
//

import Foundation

struct LocaleProvider {
    static func conversionUnit() -> String {
        return Locale.current.usesMetricSystem ? "m" : "f"
    }
}
