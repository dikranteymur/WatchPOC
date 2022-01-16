//
//  MeatTemperature.swift
//  2.CornivorePOC
//
//  Created by Dikran Teymur on 16.01.2022.
//

import Foundation

enum MeatTemperature: Int {
    case start = 0
    case rare = 1
    case medium = 2
    case wellDone = 3
    
    var stringValue: String {
        switch self {
            case .start:
                return "Start Cooking"
            case .rare:
                return "Rare"
            case .medium:
                return "Medium"
            case .wellDone:
                return "Well Done"
        }
    }
}
