//
//  MapViewController.swift
//  connetme
//
//  Created by Shankar Prajapati on 8/20/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    
    @IBOutlet var map: MKMapView!
    
    var manager: CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        // Do any additional setup after loading the view.
    }

    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //userLocation - there is no need for casting, because we are now using CLLocation object
        
        let userLocation:CLLocation = locations[0]
        
        let latitude:CLLocationDegrees = userLocation.coordinate.latitude
        
        let longitude:CLLocationDegrees = userLocation.coordinate.longitude
        
        let latDelta:CLLocationDegrees = 0.005
        
        let lonDelta:CLLocationDegrees = 0.005
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        map.setRegion(region, animated: false)
        
        //Annotation
        
        var annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        
        annotation.title = "Shanky"
        
        annotation.subtitle = "Application Developer"
        
        map.addAnnotation(annotation)
        
        let uilpgr = UILongPressGestureRecognizer(target: self, action:#selector(MapViewController.action(_:)))
        
                uilpgr.minimumPressDuration = 2
        
                map.addGestureRecognizer(uilpgr)
        
    }
    
    func action(gestureRecognizer: UIGestureRecognizer) {
        
        print("Gesture Recognized")
        
        
         var touchPoint = gestureRecognizer.locationInView(self.map)
        
                _ = gestureRecognizer.locationInView(self.map)
        
                var newCoordinate: CLLocationCoordinate2D = map.convertPoint(touchPoint, toCoordinateFromView: self.map)
        
                var annotation = MKPointAnnotation()
        
                annotation.coordinate = newCoordinate
        
                annotation.title = "Added to your friend's List"
        
                map.addAnnotation(annotation)

    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
