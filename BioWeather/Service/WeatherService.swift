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

    func fetchCurrentWeather() async throws -> CurrentWeather {
        let currentLocation = LocationManager.shared.currentLocation
        let locationCoordinates = Coordinates.from(currentLocation)

        let endpoint = CurrentWeatherEndpoint(location: locationCoordinates)
        let responseData = try await networkProvider.requestData(from: endpoint)

        let parsedData: CurrentWeather = try dataParser.process(data: responseData)
        return parsedData
    }
}
