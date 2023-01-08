//
//  Service.swift
//  BioWeather
//
//  Created by Rafael Lima on 07/01/2023.
//

import Foundation

protocol NetworkService {
    var dataParser: DataParser { get }
    var networkProvider: NetworkProvider { get }
}
