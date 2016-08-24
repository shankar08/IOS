//
//  ViewController.swift
//  Memorable Places
//
//  Created by Shankar Prajapati on 8/8/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    var manager: CLLocationManager!
    
    @IBOutlet var mapData: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
        if activePlace == -1 {
            
            manager.requestWhenInUseAuthorization()
            manager.startUpdatingLocation()
            
        } else {
         
            let latitude = NSString(string:places[activePlace]["lat"]!).doubleValue
            
            let longitude = NSString(string:places[activePlace]["lon"]!).doubleValue
            
            let coordinate = CLLocationCoordinate2DMake(latitude, longitude)
            
            let latDelta:CLLocationDegrees = 0.01
            let lonDelta:CLLocationDegrees = 0.01
            
            let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
            
            let region:MKCoordinateRegion = MKCoordinateRegionMake(coordinate, span)
            
            self.mapData.setRegion(region, animated: true)
            
            let annotation = MKPointAnnotation()
            
            annotation.coordinate = coordinate
            
            annotation.title = places[activePlace]["name"]
            
            self.mapData.addAnnotation(annotation)
            
            
            
        }
        
        //this codes drops down pin for long press
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.myaction))
        
        uilpgr.minimumPressDuration = 2
        
        mapData.addGestureRecognizer(uilpgr)
        
        
    }
    
    func myaction(gestureRecognizer:UIGestureRecognizer){
        
        if gestureRecognizer.state == UIGestureRecognizerState.began{
            
            let touchPoint = gestureRecognizer.location(in: self.mapData)
            
            let newCoordinate = self.mapData.convert(touchPoint, toCoordinateFrom: self.mapData)
            
            let location = CLLocation(latitude: newCoordinate.latitude, longitude: newCoordinate.longitude)
            
            
            CLGeocoder().reverseGeocodeLocation(location, completionHandler: { (placemarks, error) in
               
                var newtitle = ""

                
                if error == nil {
                    if let p = placemarks![0] as CLPlacemark! {
                        
                        var subThoroughfare:String = ""
                        var thoroughfare:String = ""
                        
                        if p.subThoroughfare != nil {
                            subThoroughfare = p.subThoroughfare!
                        }
                        if p.thoroughfare != nil {
                            thoroughfare = p.thoroughfare!
                        }
                        
                         newtitle = "\(subThoroughfare) \(thoroughfare)"
                        
                    }
                }
                
                if newtitle == "" {
                    newtitle = "Added \(NSDate())"
                }
                
                places.append(["name":newtitle,"lat":"\(newCoordinate.latitude)","lon":"\(newCoordinate.longitude)"])
                
                let annotation = MKPointAnnotation()
                
                annotation.coordinate = newCoordinate
                
                annotation.title = newtitle
                
                self.mapData.addAnnotation(annotation)
                
               // print(newtitle)
            })  
                
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       
        //user location is used to center the map and zoom in
        let userLocation:CLLocation = locations[0]
        let latitude = userLocation.coordinate.latitude
        let longitude = userLocation.coordinate.longitude
        
        let coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        
        let latDelta:CLLocationDegrees = 0.05
        let lonDelta:CLLocationDegrees = 0.05
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(coordinate, span)
        
        self.mapData.setRegion(region, animated: true)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

