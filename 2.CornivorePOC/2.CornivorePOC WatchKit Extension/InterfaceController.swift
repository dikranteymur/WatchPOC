//
//  InterfaceController.swift
//  2.CornivorePOC WatchKit Extension
//
//  Created by Dikran Teymur on 15.01.2022.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var timer: WKInterfaceTimer!
    @IBOutlet weak var timerButton: WKInterfaceButton!
    @IBOutlet weak var weightLabel: WKInterfaceLabel!
    @IBOutlet weak var cookLabel: WKInterfaceLabel!
    
    var ounces = 16
    var cookTemp = MeatTemperature.medium
    var timerRunning = false
    var usingMetric = false
    
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
        super.awake(withContext: context)
        updateConfiguration()
    }
    
    func updateConfiguration() {
        weightLabel.setText("Weight: \(ounces) oz")
        var weight = ounces
        var unit = "oz"
        if usingMetric {
            let grams = Double(ounces) * 28.3495
            weight = Int(grams)
            unit = "gm"
        }
        weightLabel.setText("Weight: \(weight) \(unit)")
        
        cookLabel.setText(cookTemp.stringValue)
    }

    @IBAction func onTimerButton() {
        if timerRunning {
            timer.stop()
            timerButton.setTitle("Start Timer")
        } else {
            let time = cookTemp.cookTimeForOunces(ounces)
            timer.setDate(Date(timeIntervalSinceNow: time))
            timer.start()
            timerButton.setTitle("Stop Timer")
        }
        
        timerRunning.toggle()
    }
    
    override func scroll(to object: WKInterfaceObject, at scrollPosition: WKInterfaceScrollPosition, animated: Bool) {
        
    }
    
    @IBAction func onMinusButton() {
        ounces -= 1
        updateConfiguration()
    }
    
    @IBAction func onPlusButton() {
        ounces += 1
        updateConfiguration()
    }
    
    @IBAction func onTempChange(_ value: Float) {
        if let temp = MeatTemperature(rawValue: Int(value)) {
            cookTemp = temp
            updateConfiguration()
        }
    }
    
    @IBAction func onMetricChanged(_ value: Bool) {
        usingMetric = value
        updateConfiguration()
    }
    
    
    
    
}

extension InterfaceController {
    override func interfaceOffsetDidScrollToTop() {
        print("User scrolled to top")
    }
    
    override func interfaceDidScrollToTop() {
        // Saatin en ustunde bulunan saatin bulundugu alana basildiginda calisir
        print("User went to top by tapping status bar")
    }
    
    override func interfaceOffsetDidScrollToBottom() {
        print("User scrolled to bottom")
    }
}
