//
//  AuthenticationViewModel.swift
//  BioWeather
//
//  Created by Rafael Lima on 06/01/2023.
//

import SwiftUI
import LocalAuthentication

class AuthenticationViewModel: ObservableObject {

    private let locationAuthSession: LAContext = LAContext()
    @AppStorage("isAuthenticated") private var isAuthenticated = false

    func authenticateUser() {
        if isBiometricAuthAvailable() {
            biometricAuthentication()
        } else {
            userNameAuthentication()
        }
    }

    private func isBiometricAuthAvailable() -> Bool {
        return locationAuthSession.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: .none)
    }

    private func biometricAuthentication() {
        Task {
            do {
                try await locationAuthSession.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "To access the current location weather")
                toogleAuthStatus()
            } catch {
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.isAuthenticated = false
                }
            }
        }
    }

    private func userNameAuthentication() {
        // On the rare cases that we do not have biometric auth available
        // As we do not have a process defined, we just login the user
        toogleAuthStatus()
    }

    private func toogleAuthStatus() {
        DispatchQueue.main.async {
            self.isAuthenticated = true
        }
    }
}
