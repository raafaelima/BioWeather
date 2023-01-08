//
//  Endpoint.swift
//  BioWeather
//
//  Created by Rafael Lima on 07/01/2023.
//

import Foundation

protocol Endpoint {
    var path: EndpointPath { get set }
    var params: [URLQueryItem] { get set }
}
