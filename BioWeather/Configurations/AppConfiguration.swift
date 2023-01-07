//
//  AppConfiguration.swift
//  BioWeather
//
//  Created by Rafael Lima on 07/01/2023.
//

import Foundation

struct AppConfiguration {

    static let shared = AppConfiguration()

    let host: String
    let apiKey: String
    let contentType: String

    private init() {
        self.host = AppConfiguration.fromBundle("Host")
        self.apiKey = AppConfiguration.fromBundle("ApiKey")
        self.contentType = AppConfiguration.fromBundle("ContentType")
    }

    private static func fromBundle(_ key: String) -> String {
        return Bundle.main.infoDictionary![key] as? String ?? ""
    }
}
