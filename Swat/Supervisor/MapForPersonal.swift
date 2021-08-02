//
//  MapForPersonal.swift
//  Swat
//
//  Created by mahmoud abdelfattah on 9/20/20.
//  Copyright © 2020 mahmoud abdelfattah. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapForPersonal: UIViewController {
    
    @IBOutlet weak var adress: UILabel!
    @IBOutlet weak var MapView: MKMapView!
    let locationManager = CLLocationManager()
    let resignInMeters : Double = 1000
    var previousLocation : CLLocation?
    var directionsArray : [MKDirections] = []

    override func viewDidLoad() {
        super.viewDidLoad()
       checkLocationAuthorization()
    }
    
    // zoom in map
    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate{
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: resignInMeters, longitudinalMeters: resignInMeters)
            MapView.setRegion(region, animated: true)
        }
    }
    
    // func get Direcition
    func getDirection(){
        guard let location = locationManager.location?.coordinate
        else{
            return
        }
        let request = CreateDirectionsRequest(from: location)
        let directions = MKDirections(request: request)
        ResetMapView(withNew: directions)
        directions.calculate { [unowned self] (response , error) in
            guard let response = response else {return}
            for route in response.routes {
                self.MapView.addOverlay(route.polyline)
                self.MapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
            }
        }
    }
    
    func CreateDirectionsRequest(from coordinate : CLLocationCoordinate2D) ->
        
        MKDirections.Request {
        let destinationCoordinate = getCenterLocation(for: MapView).coordinate
        let startingLocation = MKPlacemark(coordinate: coordinate)
        let destination = MKPlacemark(coordinate: destinationCoordinate)
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: startingLocation)
        request.destination = MKMapItem(placemark: destination)
        request.transportType = .automobile
        request.requestsAlternateRoutes = true
        return request
    }
    func ResetMapView (withNew direction : MKDirections){
        MapView.removeOverlay(MapView.overlays as! MKOverlay)
        directionsArray.append(direction)
        let _ = directionsArray.map{ $0.cancel() }
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
       // MapView.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest

    }
    func chackLocationServieces() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        }else {

        }
    }
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus(){
        case .authorizedWhenInUse :
            // do map stuff
           startTracking()
        //    previousLocation = getCenterLocation(for: MapView)
            break
        case .denied:
            // Show alert instructing them how to turn on permissions
            break
        case .restricted:
            // Show an alert letting them know what's up
            break
        case .authorizedAlways:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        @unknown default: break

        }
    }
    
    func getCenterLocation (for mapView : MKMapView) -> CLLocation {
        let latitude = MapView.centerCoordinate.latitude
        let longitude = MapView.centerCoordinate.longitude
        return CLLocation(latitude: latitude, longitude: longitude)
    }
    func startTracking() {
        MapView.showsUserLocation = true
        centerViewOnUserLocation()
        locationManager.startUpdatingLocation()
        previousLocation = getCenterLocation(for: MapView)
    }
}



extension MapForPersonal : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
}


extension MapForPersonal : MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let center = getCenterLocation(for: mapView)
        let geoCoder = CLGeocoder()
        guard let previousLocation = self.previousLocation else {return}
        guard center.distance(from: previousLocation) > 50 else {return}
        self.previousLocation = center
        geoCoder.cancelGeocode()
        geoCoder.reverseGeocodeLocation(center) { [weak self] (placemarks, errore) in
            guard let self = self else  {return}
            if let _ = errore {
                // Tooo Show alert informing the user
                return
            }
            guard let placmark = placemarks?.first else {
                return
            }
            let streetNumber = placmark.subThoroughfare ?? ""
            let streetName = placmark.thoroughfare ?? ""
            print(streetNumber)
            DispatchQueue.main.sync {
                self.adress.text = "\(streetName) \(streetNumber)"
            }
        }
    }
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(polyline: overlay as! MKPolyline)
        renderer.strokeColor = .blue
        return renderer
    }
}
