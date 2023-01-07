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

    private let service: Service = WeatherService()

    init(currentWeather: CurrentWeather = CurrentWeather.noData) {
        self.currentWeather = currentWeather
    }

    func loadCurrentWeatherFromLocation() {
        let currentLocation = LocationManager.shared.currentLocation
        let locationCoordinates = Coordinates.from(currentLocation)

        Task {
            let weather = await service.fetchCurrentWeather(from: locationCoordinates)
            DispatchQueue.main.async {
                withAnimation {
                    self.currentWeather = weather
                    self.isLoadingData = false
                }
            }
        }
    }
}
