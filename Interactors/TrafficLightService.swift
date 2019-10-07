//
//  TrafficLightService.swift
//  TrafficlihgtsMVP
//
//  Created by Desarrollo on 10/5/19.
//  Copyright © 2019 Global Pay Solutions. All rights reserved.
//

import Foundation

class TrafficLightService {
    
    func getTrafficLightService(colorName:(String), callback:(TrafficLight?) -> Void) {
        let trafficLights = [ TrafficLight(colorName: "Red", description: "Stop"),
                              TrafficLight(colorName: "Yellow", description: "About to change to red"),
                              TrafficLight(colorName: "Green", description: "GO!")
                            ]
        if let foundTrafficLight = trafficLights.first(where: {$0.colorName == colorName}) {
                callback(foundTrafficLight)
        }
        else {
            callback(nil)
        }
    }
}
