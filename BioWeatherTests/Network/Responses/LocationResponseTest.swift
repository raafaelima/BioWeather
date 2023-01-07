//
//  LocationResponseTest.swift
//  BioWeatherTests
//
//  Created by Rafael Lima on 07/01/2023.
//

import Foundation
import XCTest

@testable import BioWeather

class LocationResponseTest: XCTestCase {

    var sut: Location!

    override func setUp() {
        super.setUp()
        sut = JSONHelper.getObjectFrom(json: "location", type: Location.self)!
    }

    func testResponseWillParseTheCorrectDataFromServerResponse() throws {
        XCTAssertEqual(sut.name, "Recife")
        XCTAssertEqual(sut.country, "Brazil")
        XCTAssertEqual(sut.region, "Pernambuco")
        XCTAssertEqual(sut.latitude, -8.050)
        XCTAssertEqual(sut.longitude, -34.900)
    }
}
