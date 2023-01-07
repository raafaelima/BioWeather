//
//  WeatherService.swift
//  BioWeather
//
//  Created by Rafael Lima on 07/01/2023.
//

struct WeatherService: Service {

    var dataParser: DataParser
    var networkProvider: NetworkProvider

    init(dataParser: DataParser = JsonDataParser(),
         networkProvider: NetworkProvider = URLSessionNetworkProvider()) {
        self.dataParser = dataParser
        self.networkProvider = networkProvider
    }

    func fetchCurrentWeather(from location: Coordinates) async -> CurrentWeather {
        do {
            let endpoint = CurrentWeatherEndpoint(location: location)
            let responseData = try await networkProvider.requestData(from: endpoint)
            let parsedData: CurrentWeather = try dataParser.process(data: responseData)
            return parsedData
        } catch {
            print(error.localizedDescription)
            return CurrentWeather.noData
        }
    }
}
