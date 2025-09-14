//
//  Exercise_1.swift
//  List7
//
//  Created by Jakub Tokarski on 04/06/2025.
//

import SwiftUI
import MapKit

struct  Exercise_1 : View {
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 37.3349, longitude: -122.0090),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    )

    var body: some View {
        Map(position: $position) {
            Annotation("Apple Park", coordinate: CLLocationCoordinate2D(latitude: 37.3349, longitude: -122.0090)) {
                VStack{
                    Image(systemName: "mappin.circle.fill")
                        .foregroundColor(.red)
                        .font(.title)
                    Text("Apple Park")
                        .font(.caption)
                    Text("Cupertino")
                        .font(.caption2)
                        .foregroundColor(.gray)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    Exercise_1()
}
