//
//  CurrentWeatherViewModel.swift
//  BioWeather
//
//  Created by Rafael Lima on 07/01/2023.
//

import Foundation
import SwiftUI

class CurrentWeatherViewModel: ObservableObject {

    @Published var currentWeather: CurrentWeather
    @Published var isLoadingData: Bool = true
    @Published var errorAtLoadingWeatherData: Bool = false

    private let service: Service = WeatherService()

    init(currentWeather: CurrentWeather = CurrentWeather.noData) {
        self.currentWeather = currentWeather
    }

    func loadCurrentWeatherFromLocation() {
        resetScreenState()

        Task {
            do {
                let weather = try await service.fetchCurrentWeather()
                updateUIWithWeatherData(weatherData: weather)
            } catch {
                print(error.localizedDescription)
                raiseErrorAtLoadingData()
            }
        }
    }

    private func updateUIWithWeatherData(weatherData: CurrentWeather) {
        DispatchQueue.main.async {
            withAnimation {
                self.currentWeather = weatherData
                self.isLoadingData = false
                self.errorAtLoadingWeatherData = false
            }
        }
    }

    private func raiseErrorAtLoadingData() {
        DispatchQueue.main.async {
            withAnimation {
                self.isLoadingData = false
                self.errorAtLoadingWeatherData = true
            }
        }
    }

    private func resetScreenState() {
        self.isLoadingData = true
        self.errorAtLoadingWeatherData = false
    }
}
