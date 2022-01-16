//
//  InterfaceController.swift
//  1.HelloAppleWatchPOC WatchKit Extension
//
//  Created by Dikran Teymur on 15.01.2022.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var label: WKInterfaceLabel!
    @IBOutlet weak var countLabel: WKInterfaceLabel!
    @IBOutlet weak var slider: WKInterfaceSlider!
    
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
        // Sadece 1 defa calisir
        print("awake calisti")
        
        setupSlider()
        
    }
    
    func setupSlider() {
        slider.setNumberOfSteps(10)

    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        // Uygulama her acildiginda calisir
        print("willActivate calisti")

    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        // Uygulama her arka plana gectiginde calisir
        print("didDeactive calisti")
    }
    
    @IBAction func tapMeButtonTapped() {
        label.setText("Merhaba, Dikran!")
    }
    
    @IBAction func sliderTapped(_ value: Float) {
        countLabel.setText(String(Int(value)))
        
    }
    
}
