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
    private let coordinates: Coordinates = Coordinates(latitude: -8.050, longitude: -34.900)

    override func setUp() {
        super.setUp()
        sut = WeatherService(dataParser: dataParserMock, networkProvider: networkProviderMock)
    }

    func testServiceReturnListWhenTheDataIsValid() async throws {
        let currentWeather = await sut.fetchCurrentWeather(from: coordinates)
        XCTAssertEqual(currentWeather.location.name, "Recife")
        XCTAssertEqual(currentWeather.location.country, "Brazil")
        XCTAssertEqual(currentWeather.location.region, "Pernambuco")
        XCTAssertEqual(currentWeather.weather.temperature, 28)
        XCTAssertEqual(currentWeather.weather.feelsLike, 32)
        XCTAssertEqual(currentWeather.weather.humidity, 74)
    }

    func testServiceReturnEmptyDataWhenParseIsError() async throws {
        dataParserMock.forceError = true

        let currentWeather = await sut.fetchCurrentWeather(from: coordinates)
        XCTAssertTrue(currentWeather.location.name.isEmpty)
        XCTAssertEqual(currentWeather.weather.temperature, 0)
    }
}
