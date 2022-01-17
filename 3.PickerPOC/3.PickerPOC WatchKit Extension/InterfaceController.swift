//
//  InterfaceController.swift
//  3.PickerPOC WatchKit Extension
//
//  Created by Dikran Teymur on 16.01.2022.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var timer: WKInterfaceTimer!
    @IBOutlet weak var timerButton: WKInterfaceButton!
    @IBOutlet weak var weightPicker: WKInterfacePicker!
    @IBOutlet weak var temperatureLabel: WKInterfaceLabel!
    @IBOutlet weak var temperaturePicker: WKInterfacePicker!
    
    var ounces = 16
    var cookTemp = MeatTemperature.medium
    var timerRunning = false
    var weightItems: [WKPickerItem] = []
    var tempItems: [WKPickerItem] = []

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        updateConfiguration()
        for i in 1...32 {
            let item = WKPickerItem()
            item.title = String(i)
            weightItems.append(item)
        }
        weightPicker.setItems(weightItems)
        weightPicker.setSelectedItemIndex(ounces - 1)
        
        for i in 1...4 {
            let item = WKPickerItem()
            item.contentImage = WKImage(imageName: "temp-\(i)")
            tempItems.append(item)
        }
        temperaturePicker.setItems(tempItems)
        onTemperatureChanged(0)
    }
    
    func updateConfiguration() {
        
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
    
    @IBAction func onWeightChanged(_ value: Int) {
        ounces = value + 1
    }
    
    @IBAction func onTemperatureChanged(_ value: Int) {
        let temp = MeatTemperature(rawValue: value)!
        cookTemp = temp
        temperatureLabel.setText(temp.stringValue)
    }
    
}
