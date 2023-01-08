//
//  URLBuilder.swift
//  BioWeather
//
//  Created by Rafael Lima on 07/01/2023.
//

import Foundation

protocol URLBuilding {
    func build(to path: String, with params: [URLQueryItem]) -> URL
}

struct URLBuilder: URLBuilding {

    func build(to path: String = "", with params: [URLQueryItem] = []) -> URL {
        var components = URLComponents(string: host() + path)
        components?.queryItems = baseRequestQueryItens()
        components?.queryItems?.append(contentsOf: params)
        return (components?.url)!
    }

    private func baseRequestQueryItens() -> [URLQueryItem] {
        return [
            URLQueryItem(name: QueryItemKey.accessKey.rawValue, value: apiKey()),
            URLQueryItem(name: QueryItemKey.conversionUnit.rawValue, value: LocaleProvider.conversionUnit())
        ]
    }

    private func host() -> String {
        return AppConfiguration.shared.host
    }

    private func apiKey() -> String {
        return AppConfiguration.shared.apiKey
    }
}
