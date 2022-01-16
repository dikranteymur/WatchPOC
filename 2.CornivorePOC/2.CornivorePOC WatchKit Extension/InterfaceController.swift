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
    @IBOutlet weak var weightLabel: WKInterfaceLabel!
    
    var ounces = 16
    
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
        super.awake(withContext: context)
        updateConfiguration()
    }
    
    func updateConfiguration() {
        weightLabel.setText("Weight: \(ounces) oz")
    }

    @IBAction func onTimerButton() {
        let countdown: TimeInterval = 20
        let date = Date(timeIntervalSinceNow: countdown)
        
        timer.setDate(date)
        timer.start()
    }
    
    @IBAction func onMinusButton() {
        ounces -= 1
        updateConfiguration()
    }
    
    @IBAction func onPlusButton() {
        ounces += 1
        updateConfiguration()
    }
    
}
