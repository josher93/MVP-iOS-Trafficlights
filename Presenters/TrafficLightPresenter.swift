//
//  TrafficLightPresenter.swift
//  TrafficlihgtsMVP
//
//  Created by Desarrollo on 10/5/19.
//  Copyright © 2019 Global Pay Solutions. All rights reserved.
//

import Foundation

class TrafficLightPresenter {
    
    private let trafficLightService: TrafficLightService
    weak private var trafficLightViewDelegate: TrafficLightViewDelegate?
    
    init(trafficLightService: TrafficLightService) {
        self.trafficLightService = trafficLightService
    }
    
    func setViewDelegate(trafficLightViewDelegate: TrafficLightViewDelegate?) {
        self.trafficLightViewDelegate = trafficLightViewDelegate
    }
    
    func trafficLightColorSelected(colorName:(String)){
        
        trafficLightService.getTrafficLightService(colorName: colorName) {
            
            [weak self] trafficLight in
            
            if let trafficLight = trafficLight {
                self?.trafficLightViewDelegate?.displayTrafficLight(description: trafficLight.description)
            }
        }
    }
}


