//
//  JsonDataParser.swift
//  BioWeather
//
//  Created by Rafael Lima on 07/01/2023.
//

import Foundation

struct JsonDataParser: DataParser {

    func process<T: Codable>(data: Data) throws -> T {
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            print(error.localizedDescription)
            throw ParserError.invalidData
        }
    }
}
