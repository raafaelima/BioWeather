//
//  CurrentWeatherEndpointTest.swift
//  BioWeatherTests
//
//  Created by Rafael Lima on 07/01/2023.
//

import Foundation
import XCTest

@testable import BioWeather

class CurrentWeatherEndpointTest: XCTestCase {

    private var sut: CurrentWeatherEndpoint!

    override func setUp() {
        super.setUp()
        let coordinates = Coordinates(latitude: 40.7831, longitude: -73.9712)
        sut = CurrentWeatherEndpoint(location: coordinates)
    }

    func testPathWillBeFilled() throws {
        XCTAssertEqual(sut.path, "/current")
    }

    func testQueryParamsExists() throws {
        XCTAssertEqual(sut.params.count, 1)
    }

    func testQueryParamsHaveTheCorrectValue() throws {
        XCTAssertEqual(sut.params.first?.name, "query")
        XCTAssertEqual(sut.params.first?.value, "40.7831,-73.9712")
    }
}
