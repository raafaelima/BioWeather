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
        self.host = AppConfiguration.fromBundle(.host)
        self.apiKey = AppConfiguration.fromBundle(.apiKey)
        self.contentType = AppConfiguration.fromBundle(.contentType)
    }

    private static func fromBundle(_ key: ConfigKey) -> String {
        return Bundle.main.infoDictionary![key.rawValue] as? String ?? ""
    }
}

private enum ConfigKey: String {
    case host = "Host"
    case apiKey = "ApiKey"
    case contentType = "ContentType"
}
