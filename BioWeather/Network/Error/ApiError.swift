//
//  ApiError.swift
//  BioWeather
//
//  Created by Rafael Lima on 07/01/2023.
//

import Foundation

enum ApiError: Error {
    case emptyData
    case notReachable
    case generic
}
