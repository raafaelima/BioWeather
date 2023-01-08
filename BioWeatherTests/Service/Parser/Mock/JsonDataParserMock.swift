//
//  JsonDataParserMock.swift
//  BioWeatherTests
//
//  Created by Rafael Lima on 07/01/2023.
//

import Foundation

@testable import BioWeather

class JsonDataParserMock: DataParser {

    var forceError: Bool = false

    func process<T: Codable>(data: Data) throws -> T {
        if forceError {
            throw ParserError.invalidData
        } else {
            return JSONHelper.getObjectFrom(json: "current-weather", type: T.self)!
        }
    }
}
