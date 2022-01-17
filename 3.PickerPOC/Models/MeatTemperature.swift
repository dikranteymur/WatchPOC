//
//  MeatTemperature.swift
//  3.PickerPOC
//
//  Created by Dikran Teymur on 17.01.2022.
//

import Foundation

enum MeatTemperature: Int {
    case rare = 0, mediumRate, medium, wellDone
    
    var stringValue: String {
        let temperature = ["Rare", "Medium Rate", "Medium", "Well Done"]
        return temperature[self.rawValue]
    }
    
    var timeModifier: Double {
        let modifiers = [0.5, 0.75, 1.0, 1.5]
        return modifiers[self.rawValue]
    }
    
    func cookTimeForOunces(_ ounces: Int) -> TimeInterval {
        let baseTime: TimeInterval = 47 * 60
        let baseWeight = 16
        let weightModifier: Double = Double(ounces) / Double(baseWeight)
        let tempModifier = self.timeModifier
        return baseTime * weightModifier * tempModifier
    }
}
