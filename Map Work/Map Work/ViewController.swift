//
//  ViewController.swift
//  Map Work
//
//  Created by Shankar Prajapati on 7/27/16.
//  Copyright © 2016 Shankar Prajapati. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Defining latitute
        let latitute:CLLocationDegrees = 32.820949
        //define longtitue
        let longitute:CLLocationDegrees = -97.093827
        //This defines how much lat is stretched
        let latDelta:CLLocationDegrees = 0.05
        //this defines how much long is stretched
        let lonDelta:CLLocationDegrees = 0.05
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitute, longitute)
        //chosing the loccation in the map.
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        //presenting  the map in the view
        map.setRegion(region, animated: true)
        
        
        ////////////////////
        //this code is for the pin
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        
        annotation.title = "My home"
        
        annotation.subtitle = "This is my city"
        
        map.addAnnotation(annotation)
      
        
        //we are setting longpress gesture which will drop a pin
        
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.action))
    
        uilpgr.minimumPressDuration = 2
        
        map.addGestureRecognizer(uilpgr)
        
        
    }
    
    func action(gestureRecognizer: UIGestureRecognizer){
        print("Gesture Recognized")

        let touchPoint = gestureRecognizer.location(in: self.map)
        
        let newCoordinate: CLLocationCoordinate2D = map.convert(touchPoint, toCoordinateFrom: self.map)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = newCoordinate
        
        annotation.title = "New Place"
        
        annotation.subtitle = "One day I will go there "
        
        map.addAnnotation(annotation)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

