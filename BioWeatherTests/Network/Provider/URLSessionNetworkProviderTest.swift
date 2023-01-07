//
//  URLSessionNetworkProviderTest.swift
//  BioWeatherTests
//
//  Created by Rafael Lima on 07/01/2023.
//

import Foundation
import XCTest

@testable import BioWeather

class URLSessionNetworkProviderTest: XCTestCase {

    private var sut: NetworkProvider!
    private var mockSession: URLSession!

    private let endpoint: Endpoint = DummyEndpoint()
    private let reachabilityMock: ReachabilityMock = ReachabilityMock()

    override func setUp() {
        super.setUp()
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [URLProtocolMock.self]
        mockSession = URLSession(configuration: configuration)
        sut = URLSessionNetworkProvider(session: mockSession, reachability: reachabilityMock)
    }

    func testShouldReturnValidData() async throws {

        URLProtocolMock.requestHandler = { _ in
            return (HTTPURLResponse(), Data())
        }

        do {
            let response = try await sut.requestData(from: endpoint)
            XCTAssertNotNil(response)
        } catch {
            XCTFail("expectation not fullfilled")
        }
    }

    func testShouldReturnEmptyDataErrorWhenThereIsNoResponseFromServer() async throws {

        let expectation = XCTestExpectation(description: "response")

        URLProtocolMock.requestHandler = { _ in
            return (HTTPURLResponse(), nil)
        }

        do {
            _ = try await sut.requestData(from: endpoint)
        } catch {
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
    }

    func testShouldReadDataFromCacheWhenInternetIsNotAvailable() async throws {
        reachabilityMock.forceError = true

        do {
            _ = try await sut.requestData(from: endpoint)
        } catch {
            let apiError = error as? ApiError
            XCTAssertNotNil(apiError)
            XCTAssertEqual(apiError, .notReachable)
        }
    }
}
