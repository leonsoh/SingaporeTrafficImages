//
//  MapViewController.swift
//  TrafficApp
//
//  Created by Leon on 22/7/21.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
   
    let viewModel = TrafficViewModel()
    let alertHelper = AlertHelper()
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        mapView.delegate = self
        viewModel.apiService.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.getTrafficImages()
    }
    
    
    func addAnnotations(latitude: Double, longitude: Double) {
        let annotation = MKPointAnnotation()
        let coordType = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        annotation.coordinate = coordType
        
        DispatchQueue.main.async {
            self.mapView.addAnnotation(annotation)
        }
    }
    
}

extension MapViewController: TrafficDelegate {
    func getTrafficData(data: [Traffic]) {
        _ = data.map({addAnnotations(latitude: $0.latitude, longitude: $0.longitude)})
    }
}

extension MapViewController: DataHelperDelegate {
    func dataHelperDidFailure(message: String) {
        alertHelper.displayError(errorMessage: message, controller: self)
    }
}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: nil)
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let traffics = viewModel.trafficData
        let annotationCoordinate = view.annotation?.coordinate
        
        if traffics.count > 0 {
            let selectedTraffic = traffics.filter {annotationCoordinate?.latitude == $0.latitude && annotationCoordinate?.longitude == $0.longitude}
            
            let trafficImageUrl = selectedTraffic.first?.imageUrl ?? "empty image"
            if let url = URL(string: trafficImageUrl) {
                let customAlertVC = NavigationHelper.getViewController(NavigationHelper.MAIN_STORYBOARD, "customAlert") as! CustomAlertViewController
                customAlertVC.image = UIImage(url: url)
                self.present(customAlertVC, animated: true, completion: nil)
            }
        }
    }
}
