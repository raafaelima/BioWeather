//
//  JsonDataParserTest.swift
//  BioWeatherTests
//
//  Created by Rafael Lima on 07/01/2023.
//

import Foundation
import XCTest

@testable import BioWeather

class JsonDataParserTest: XCTestCase {

    private var sut: JsonDataParser!

    override func setUp() {
        super.setUp()
        sut = JsonDataParser()
    }

    func testShouldReturnDataParsingErrorWhenDataIsEmpty() throws {

        let expectation = XCTestExpectation(description: "response")

        let mockData = "".data(using: .utf8)

        do {
            let _: String = try sut.process(data: mockData!)
        } catch {
            XCTAssertEqual(error as? ParserError, .invalidData)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
    }

    func testShouldReturnDataParsingErrorWhenDataIsWrong() throws {

        let expectation = XCTestExpectation(description: "response")

        let mockData = "[{\"dummy\":\"dummy\"}]".data(using: .utf8)

        do {
            let _: MockResponse = try sut.process(data: mockData!)
        } catch {
            XCTAssertEqual(error as? ParserError, .invalidData)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
    }

    func testShouldReturnValidDataWhenServerRespondAValidJson() throws {

        let expectation = XCTestExpectation(description: "response")

        let mockData = "{\"mock\":\"dummy\"}".data(using: .utf8)

        do {
            let response: MockResponse = try sut.process(data: mockData!)
            XCTAssertEqual(response.mock, "dummy")
            expectation.fulfill()
        } catch {
            XCTFail("expectation not fullfilled")
        }

        wait(for: [expectation], timeout: 1)
    }
}

struct MockResponse: Codable {
    let mock: String
}
