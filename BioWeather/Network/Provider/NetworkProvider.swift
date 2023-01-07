//
//  NetworkProvider.swift
//  BioWeather
//
//  Created by Rafael Lima on 07/01/2023.
//

import Foundation

protocol NetworkProvider {
    var reachability: ReachabilityType { get }
    func requestData(from endpoint: Endpoint) async throws -> Data
}
