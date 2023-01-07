//
//  Endpoint+UrlRequest.swift
//  BioWeather
//
//  Created by Rafael Lima on 07/01/2023.
//

import Foundation

extension Endpoint {
    func urlRequest() -> URLRequest {
        let builder: URLBuilding = URLBuilder()
        let endpointURL = builder.build(to: path, with: params)

        var request = URLRequest(url: endpointURL)
        request.addValue(contentType(), forHTTPHeaderField: "Accept")
        request.addValue(contentType(), forHTTPHeaderField: "Content-Type")
        return request
    }

    private func contentType() -> String {
        return AppConfiguration.shared.contentType
    }
}
