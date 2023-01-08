//
//  DataParser.swift
//  BioWeather
//
//  Created by Rafael Lima on 07/01/2023.
//

import Foundation

protocol DataParser {
    func process<T: Codable>(data: Data) throws -> T
}
