//
//  AppLauncher.swift
//  BioWeather
//
//  Created by Rafael Lima on 07/01/2023.
//

import Foundation
import SwiftUI

// If we have a XCTestCase on the stack (i.e. we're running unit tests), use that to avoid executing initialisation code in prod scheme
// The BioWeatherTestApp will only exist when running unit tests
// Source: https://mokacoding.com/blog/prevent-swiftui-app-loading-in-unit-tests/
@main
struct AppLauncher {
    static func main() throws {
        if NSClassFromString("XCTestCase") == nil {
            BioWeatherApp.main()
        } else {
            BioWeatherTestApp.main()
        }
    }
}
