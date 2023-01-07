//
//  CurrentWeatherResponseTest.swift
//  BioWeatherTests
//
//  Created by Rafael Lima on 07/01/2023.
//

import Foundation
import XCTest

@testable import BioWeather

class WeatherResponseTest: XCTestCase {

    var sut: CurrentWeather!

    override func setUp() {
        super.setUp()
        sut = JSONHelper.getObjectFrom(json: "current-weather", type: CurrentWeather.self)!
    }

    func testResponseWillParseTheCorrectDataFromServerResponse() throws {
        XCTAssertEqual(sut.weather.temperature, 28)
        XCTAssertEqual(sut.location.country, "Brazil")
    }
}
