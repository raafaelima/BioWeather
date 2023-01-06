//
//  WeatherInformationView.swift
//  BioWeather
//
//  Created by Rafael Lima on 06/01/2023.
//

import SwiftUI

struct WeatherInformationView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct WeatherInformationView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherInformationView()
    }
}
