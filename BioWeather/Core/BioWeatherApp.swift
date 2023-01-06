//
//  BioWeatherApp.swift
//  BioWeather
//
//  Created by Rafael Lima on 06/01/2023.
//

import SwiftUI

@main
struct BioWeatherApp: App {

    @AppStorage("isAuthenticated") private var isAuthenticated = false
    @UIApplicationDelegateAdaptor(BioWeatherAppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            NavigationView {
                if isAuthenticated {
                    WeatherInformationView()
                } else {
                    AuthenticationView()
                }
            }
        }
    }
}

final class BioWeatherAppDelegate: NSObject, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        print("Application did finish launching with options")
        LocationManager.shared.requestForLocationUpdates()
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        print("Application will terminate")
        LocationManager.shared.stopReceivingLocationUpdates()
        // Remove Auth Status
        UserDefaults.standard.set(false, forKey: "isAuthenticated")
    }
}
