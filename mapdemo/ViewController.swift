//
//  ViewController.swift
//  mapdemo
//
//  Created by Simran Chakkal on 2020-01-09.
//  Copyright © 2020 Simran Chakkal. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet var mapview: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let latitude : CLLocationDegrees = 43.64
        let longitude : CLLocationDegrees = -79.38
        
        let latdelta : CLLocationDegrees = 0.05
        let longdelta : CLLocationDegrees = 0.05
        
        //defining latitude and longitude
        
        //define span
        
        let span = MKCoordinateSpan(latitudeDelta:latdelta,longitudeDelta:longdelta)
        
        //define location
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        //define rigion
        let region = MKCoordinateRegion(center: location, span: span)
        
        //set region on map
        mapview.setRegion(region, animated: true)
        
        
        //adding annotattion for map
        
        let annotation = MKPointAnnotation()
        annotation.title = "Toronto city"
        annotation.subtitle = "City of Dreams"
        
        annotation.coordinate = location
        mapview.addAnnotation(annotation)
        
        //long press gesture
        
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(longpress))
        
        mapview.addGestureRecognizer(uilpgr)
        // Do any additional setup after loading the view.
    }
    @objc func longpress(gestureRecogniser :UIGestureRecognizer){
        
        let touchpoint = gestureRecogniser.location(in: mapview)
        let coordinate  = mapview.convert(touchpoint, toCoordinateFrom: mapview)
        let annotation = MKPointAnnotation()
        annotation.title = "Place to visit"
//        annotation.subtitle = "City of Dreams"
//
       annotation.coordinate = coordinate
        
        mapview.addAnnotation(annotation)
        
    }


}

