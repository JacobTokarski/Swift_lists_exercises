//
//  Exercise_2.swift
//  List7
//
//  Created by Jakub Tokarski on 04/06/2025.
//

import SwiftUI
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    
    @Published var userLocation: CLLocationCoordinate2D?
    @Published var authorizationStatus: CLAuthorizationStatus?
    @Published var locationError: Error?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestWhenInUseAuthorization()
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let status = manager.authorizationStatus
        DispatchQueue.main.async {
            self.authorizationStatus = status
        }

        if status == .authorizedWhenInUse || status == .authorizedAlways {
            locationManager.startUpdatingLocation()
        } else {
            print("Brak zgody na lokalizację. Status: \(status.rawValue)")
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        DispatchQueue.main.async {
            self.userLocation = location.coordinate
            print("Lokalizacja: \(location.coordinate.latitude), \(location.coordinate.longitude)")
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        DispatchQueue.main.async {
            self.locationError = error
        }
        print("Błąd lokalizacji: \(error.localizedDescription)")
    }
}

struct Exercise_2 : View {
    @StateObject private var locationManager = LocationManager()

    var body: some View {
        VStack(spacing: 20) {
            if let location = locationManager.userLocation {
                Text("Twoja lokalizacja:")
                    .font(.headline)
                Text("Szerokość: \(location.latitude)")
                Text("Długość: \(location.longitude)")
            } else if let status = locationManager.authorizationStatus, status == .denied {
                Text("Brak dostępu do lokalizacji.")
                    .foregroundColor(.red)
            } else {
                Text("Pobieranie lokalizacji...")
            }

            if let error = locationManager.locationError {
                Text("Błąd: \(error.localizedDescription)")
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}

