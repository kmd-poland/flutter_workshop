//
//  CompassService.swift
//  Runner
//
//  Created by Maciej Czechowski (MCZ) on 02/07/2020.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

import Foundation
import CoreLocation


class CompassService: NSObject, CLLocationManagerDelegate {
    
    let locationManager: CLLocationManager
    let callback:(Double) -> Void
    
    init(onReading: @escaping (Double) -> Void){
        
        self.locationManager = CLLocationManager()
        self.callback = onReading
    }
    
    func startReadings(){
        locationManager.startUpdatingHeading()
        locationManager.delegate = self
    }
    
    func stopReadings(){
        locationManager.startUpdatingHeading()
        locationManager.delegate = nil
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        self.callback(newHeading.trueHeading)
    }
    
}
