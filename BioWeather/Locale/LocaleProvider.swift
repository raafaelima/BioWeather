//
//  LocaleProvider.swift
//  BioWeather
//
//  Created by Rafael Lima on 07/01/2023.
//

import Foundation

struct LocaleProvider {
    /// The conversion unit to show the data from the weatherAPI
    /// - Returns: The indication of wich metric system to use (imperial or metric)
    static func conversionUnit() -> String {
        return Locale.current.usesMetricSystem ? ConversionUnitKey.metric.rawValue : ConversionUnitKey.imperial.rawValue
    }
}

private enum ConversionUnitKey: String {
    case metric = "m"
    case imperial = "f"
}
