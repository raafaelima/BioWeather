//
//  Service.swift
//  BioWeather
//
//  Created by Rafael Lima on 07/01/2023.
//

import Foundation

protocol Service {
    var dataParser: DataParser { get }
    var networkProvider: NetworkProvider { get }
}
