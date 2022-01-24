//
//  Units.swift
//  UnitConversionCalculator
//
//  Created by auston salvana on 1/23/22.
//

import Foundation

enum Units: String, CaseIterable {
    case kilometers
    case meters
    case feet
    case yards
    case miles
    
    var prefix: String {
        switch self {
        case .kilometers:
            return "KM"
        case .meters:
            return "M"
        case .feet:
            return "FT"
        case .yards:
            return "YD"
        case .miles:
            return "MI"
        }
    }
}



