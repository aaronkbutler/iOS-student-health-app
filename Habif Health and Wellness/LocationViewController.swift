//
//  LocationViewController.swift
//  Habif Health and Wellness
//
//  Created by Aaron Butler on 11/18/19.
//  Copyright © 2019 Aaron Butler. All rights reserved.
//

import UIKit
import MapKit

class LocationViewController: UIViewController {

    @IBOutlet weak var infoText: UITextView!
    @IBOutlet weak var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let location = MKPointAnnotation()
        location.coordinate = CLLocationCoordinate2D(latitude: 38.645493, longitude: -90.313286)
        map.setRegion(MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000), animated: true)
        location.title = "Habif Health and Wellness"
        map.addAnnotation(location)
        map.centerCoordinate = location.coordinate
       
        
        // Do any additional setup after loading the view.
    }
    //https://stackoverflow.com/questions/27622437/uitextview-starts-at-bottom-or-middle-of-the-text
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        infoText.contentOffset = .zero
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
