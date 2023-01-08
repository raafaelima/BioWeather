//
//  AuthenticationViewModel.swift
//  BioWeather
//
//  Created by Rafael Lima on 06/01/2023.
//

import SwiftUI

class AuthenticationViewModel: ObservableObject {

    @AppStorage("isAuthenticated") private var isAuthenticated = false

    private let biometrictAuthService = BiometricAuthenticationService()

    func authenticateUser() {
        if biometrictAuthService.isBiometricAuthAvailable() {
            biometricAuthentication()
        } else {
            userNameAuthentication()
        }
    }

    private func biometricAuthentication() {
        Task {
            do {
                try await biometrictAuthService.startAuthentication()
                toogleAuthStatus()
            } catch {
                print(error.localizedDescription)
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
