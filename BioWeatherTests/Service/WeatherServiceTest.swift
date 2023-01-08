//
//  WeatherServiceTest.swift
//  BioWeatherTests
//
//  Created by Rafael Lima on 07/01/2023.
//

import Foundation
import XCTest

@testable import BioWeather

class WeatherServiceTest: XCTestCase {

    var sut: WeatherService!

    private let dataParserMock = JsonDataParserMock()
    private let  networkProviderMock = URLSessionNetworkProviderMock()

    override func setUp() {
        super.setUp()
        sut = WeatherService(dataParser: dataParserMock, networkProvider: networkProviderMock)
    }

    func testServiceReturnListWhenTheDataIsValid() async throws {
        let currentWeather = try await sut.fetchCurrentWeather()
        XCTAssertEqual(currentWeather.location.name, "Recife")
        XCTAssertEqual(currentWeather.location.country, "Brazil")
        XCTAssertEqual(currentWeather.location.region, "Pernambuco")
        XCTAssertEqual(currentWeather.weather.temperature, 28)
        XCTAssertEqual(currentWeather.weather.feelsLike, 32)
        XCTAssertEqual(currentWeather.weather.humidity, 74)
    }
}
