//
//  ViewController.swift
//  RideShareApp
//
//  Created by Param Yonzon on 8/19/17.
//  Copyright © 2017 Param Yonzon. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }


}

