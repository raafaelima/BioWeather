//
//  WeatherResponseTest.swift
//  BioWeatherTests
//
//  Created by Rafael Lima on 07/01/2023.
//

import Foundation
import XCTest

@testable import BioWeather

class CurrentWeatherResponseTest: XCTestCase {

    var sut: Weather!

    override func setUp() {
        super.setUp()
        sut = JSONHelper.getObjectFrom(json: "weather", type: Weather.self)!
    }

    func testResponseWillParseTheCorrectDataFromServerResponse() throws {
        XCTAssertEqual(sut.temperature, 28)
        XCTAssertEqual(sut.feelsLike, 32)
        XCTAssertEqual(sut.descriptions.first, "Partly cloudy")
    }
}
