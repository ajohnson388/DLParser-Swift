//
//  UnitConverter.swift
//  LicenseParser
//
//  Created by Andrew Johnson on 3/13/18.
//

import Foundation

struct UnitConverter {
    
    static let inchesPerCentimeter = 0.393701
    static let poundsPerKilogram = 2.20462
    
    static func inches(from centimeters: Double) -> Double {
        let rawValue = round(centimeters
            * UnitConverter.inchesPerCentimeter)
        return Double(rawValue)
    }
    
    static func pounds(from kilograms: Double) -> Double {
        let rawValue = round(kilograms
            * UnitConverter.poundsPerKilogram)
        return Double(rawValue)
    }
}
