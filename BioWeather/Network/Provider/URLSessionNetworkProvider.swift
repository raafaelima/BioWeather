//
//  URLSessionNetworkProvider.swift
//  BioWeather
//
//  Created by Rafael Lima on 07/01/2023.
//

import Foundation

struct URLSessionNetworkProvider: NetworkProvider {

    var session: URLSession
    var reachability: ReachabilityType
    private let httpSuccess = 200

    init(session: URLSession = .shared, reachability: ReachabilityType = Reachability()) {
        self.session = session
        self.reachability = reachability
    }

    func requestData(from endpoint: Endpoint) async throws -> Data {

        if reachability.currentStatus() == .notReachable {
            throw ApiError.notReachable
        } else {
            let (data, response) = try await session.data(for: endpoint.urlRequest())

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == httpSuccess else {
                throw ApiError.generic
            }

            return data
        }
    }
}
