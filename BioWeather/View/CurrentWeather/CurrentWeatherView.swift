//
//  CurrentWeatherView.swift
//  BioWeather
//
//  Created by Rafael Lima on 06/01/2023.
//

import SwiftUI

struct CurrentWeatherView: View {

    @StateObject var viewModel = CurrentWeatherViewModel()

    var body: some View {
        ZStack {
            LinearGradient(colors: [.gradientStart, .gradientEnd], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack {
                if viewModel.isLoadingData {
                    ProgressView("Loading")
                } else {
                    if viewModel.errorAtLoadingWeatherData {
                        errorAtLoadingData()
                    } else {
                        ScrollView {
                            weatherData()
                        }
                    }
                }
            }
        }
        .onAppear { viewModel.loadCurrentWeatherFromLocation() }
    }

    private func weatherData() -> some View {
        VStack(spacing: 50) {

            Image(weatherIconKey())
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)

            weatherInfo()
        }
    }

    private func weatherInfo() -> some View {
        VStack(spacing: 20) {
            Text(viewModel.currentWeather.location.description())
                .font(.system(size: 24))
                .fontWeight(.semibold)
                .shadow(radius: 25)

            Text(viewModel.currentWeather.weather.weatherState())
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .shadow(radius: 25)
                .padding(.top, -10)

            Text(viewModel.currentWeather.weather.temperatureWithIndicator())
                .font(.system(size: 96))
                .fontWeight(.semibold)
                .shadow(radius: 25)

            windSpeedAndHumidity()
        }
        .padding(20)
        .frame(width: UIScreen.main.bounds.width - 80)
        .foregroundColor(.white)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.white, lineWidth: 1)
        )
    }

    private func windSpeedAndHumidity() -> some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 10) {
                Image(systemName: "wind")
                    .resizable()
                    .frame(width: 32, height: 32)

                Text("Wind | \(windSpeed())")
                    .font(.system(size: 24))
                    .shadow(radius: 25)
            }

            HStack(spacing: 30) {
                Image(systemName: "drop")
                    .resizable()
                    .frame(width: 19, height: 26)

                Text("Hum | \(humidity())")
                    .font(.system(size: 24))
                    .shadow(radius: 25)
            }
        }
    }

    private func errorAtLoadingData() -> some View {
        VStack {
            Text("Unfortunately there was a problem with our services. Please, try again in a few seconds.")

            Button(action: viewModel.loadCurrentWeatherFromLocation, label: {
                Text("Find My Weather Info")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 6)
            })
            .padding(.horizontal, 50)
            .padding(.top, 20)
            .buttonStyle(.borderedProminent)
        }
    }

    private func windSpeed() -> String {
        let speed = viewModel.currentWeather.weather.windSpeed
        return "\(speed) km/h"
    }

    private func humidity() -> String {
        let humidity = viewModel.currentWeather.weather.humidity
        return "\(humidity) %"
    }

    func weatherIconKey() -> String {
        switch viewModel.currentWeather.weather.weatherCode {
        case 113:
            return "sunny"
        case 293, 296, 299, 302, 305, 308, 311:
            return "rainy"
        default:
            return "cloudy"
        }
    }
}

#if DEBUG
struct CurrentWeatherView_Previews: PreviewProvider {

    static var previews: some View {
        CurrentWeatherView(viewModel: viewModel())
    }

    private static func viewModel() -> CurrentWeatherViewModel {
        let porto = Location(name: "Porto", country: "Portugal", region: "Porto", latitude: 123, longitude: 456)
        let sunny = Weather(temperature: 28, feelsLike: 32, weatherCode: 116, windSpeed: 13, humidity: 74, descriptions: ["Sunny"])
        let weather = CurrentWeather(location: porto, weather: sunny)
        let vm = CurrentWeatherViewModel(currentWeather: weather)
        vm.isLoadingData = false
        return vm
    }
}
#endif
