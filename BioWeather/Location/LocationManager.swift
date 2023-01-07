//
//  LocationManager.swift
//  BioWeather
//
//  Created by Rafael Lima on 06/01/2023.
//

import Foundation
import MapKit
import Combine

/// Encapsulates the location (lat, long) data processing of the user.
/// In order to make the thins smooth across the app, the only way to acess is by the shared instance.
///
class LocationManager: NSObject {

    private var locationManager: CLLocationManager?

    /// The current location information
    var currentLocation: CLLocation?

    /// The shared singleton LocationManager oject
    static let shared = LocationManager()

    private override init() { }

    /// Request the user to start receiving location updates
    public func requestForLocationUpdates() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
    }

    /// Stop receiving location updates
    /// OBS.: Location services needs to be activated
    public func stopReceivingLocationUpdates() {
        guard let locationManager = locationManager else { return }
        locationManager.stopUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {

    public func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {

        switch manager.authorizationStatus {
        case .notDetermined:
            manager.requestAlwaysAuthorization()
        case .restricted:
            print("Your location is restricted likely due to parental control")
        case .denied:
            print("You have denied this app location permission.")
        case .authorizedAlways, .authorizedWhenInUse:
            manager.startUpdatingLocation()
        default:
            break
        }
    }

    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let updatedLocation = locations.last else { return }
        currentLocation = updatedLocation
    }

    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("LocationManager fail with error \(error.localizedDescription)")
        stopReceivingLocationUpdates()
    }
}
