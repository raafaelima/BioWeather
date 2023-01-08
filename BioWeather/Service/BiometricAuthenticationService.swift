//
//  BiometricAuthenticationService.swift
//  BioWeather
//
//  Created by Rafael Lima on 08/01/2023.
//

import Foundation
import LocalAuthentication

struct BiometricAuthenticationService {

    private let locationAuthSession: LAContext = LAContext()

    func isBiometricAuthAvailable() -> Bool {
        return locationAuthSession.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: .none)
    }

    func startAuthentication() async throws {
        try await locationAuthSession.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: "To access the current location weather")
    }
}
