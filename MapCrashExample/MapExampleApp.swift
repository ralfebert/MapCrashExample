import CoreLocation
import MapKit
import SwiftUI

@main
struct MapExampleApp: App {
    var body: some Scene {
        WindowGroup {
            MapView()
                .onAppear {
                    CLLocationManager().requestWhenInUseAuthorization()
                }
        }
    }
}

struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.334_900, longitude: -122.009_020),
        latitudinalMeters: 750,
        longitudinalMeters: 750
    )

    @State var trackingMode: MapUserTrackingMode = .follow

    var body: some View {
        Map(
            coordinateRegion: $region,
            showsUserLocation: true,
            userTrackingMode: $trackingMode
        )
        Button(trackingMode == .follow ? "Following" : "Follow") {
            switch self.trackingMode {
            case .none:
                self.trackingMode = .follow
            case .follow:
                self.trackingMode = .none
            @unknown default:
                break
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
