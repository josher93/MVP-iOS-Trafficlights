//
//  TrafficLightViewController.swift
//  TrafficlihgtsMVP
//
//  Created by Desarrollo on 10/5/19.
//  Copyright © 2019 Global Pay Solutions. All rights reserved.
//

import UIKit

class TrafficLightViewController: UIViewController, TrafficLightViewDelegate {
    
    private let trafficLightPresenter = TrafficLightPresenter(trafficLightService: TrafficLightService())
    let selectedLight = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenSize = self.view.frame.size;
        view.backgroundColor = .white
        
        
        // Red Light
        let redLightView = UIView()
        redLightView.backgroundColor = .red
        redLightView.isUserInteractionEnabled = true
        // Tap
        let redTap = UITapGestureRecognizer(target: self, action: #selector(self.redLightAction(_:)))
        redLightView.addGestureRecognizer(redTap)

        // Yellow Light
        let yellowLightView = UIView()
        yellowLightView.backgroundColor = .yellow
        yellowLightView.isUserInteractionEnabled = true
        // Tap
        let yellowTap = UITapGestureRecognizer(target: self, action: #selector(self.yellowLightAction(_:)))
        yellowLightView.addGestureRecognizer(yellowTap)
        
        // Green Light
        let greenLightView = UIView()
        greenLightView.backgroundColor = .green
        greenLightView.isUserInteractionEnabled = true
        // Tap
        let greenTap = UITapGestureRecognizer(target: self, action: #selector(self.greenLightAction(_:)))
        greenLightView.addGestureRecognizer(greenTap)
        
        // Label
        selectedLight.textColor = .black
        selectedLight.font = UIFont.systemFont(ofSize: 16)
        selectedLight.textAlignment = .center
        
        // Position
        redLightView.frame = CGRect(x: screenSize.width*0.40, y: screenSize.height*0.10, width: screenSize.width*0.20, height: screenSize.height*0.20)
        yellowLightView.frame = CGRect(x: screenSize.width*0.40, y: screenSize.height*0.35, width: screenSize.width*0.20, height: screenSize.height*0.20)
        greenLightView.frame = CGRect(x: screenSize.width*0.40, y: screenSize.height*0.60, width: screenSize.width*0.20, height: screenSize.height*0.20)
        selectedLight.frame = CGRect(x: 0, y: screenSize.height*0.85, width: screenSize.width, height: screenSize.height*0.10)
        
        // Add
        self.view.addSubview(redLightView)
        self.view.addSubview(yellowLightView)
        self.view.addSubview(greenLightView)
        self.view.addSubview(selectedLight)
        
        trafficLightPresenter.setViewDelegate(trafficLightViewDelegate: self)
    }
    
    


    @objc func redLightAction(_ sender: UITapGestureRecognizer) {
        trafficLightPresenter.trafficLightColorSelected(colorName:"Red")
    }
    
    @objc func yellowLightAction(_ sender: UITapGestureRecognizer) {
        trafficLightPresenter.trafficLightColorSelected(colorName:"Yellow")
    }
    
    @objc func greenLightAction(_ sender: UITapGestureRecognizer) {
        trafficLightPresenter.trafficLightColorSelected(colorName:"Green")
    }
    
    func displayTrafficLight(description: (String)) {
        selectedLight.text = description
    }

}
