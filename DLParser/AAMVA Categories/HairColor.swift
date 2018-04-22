//
//  HairColor.swift
//  LicenseParser
//
//  Created by Andrew Johnson on 3/12/18.
//

import Foundation

/**
     AAMVA hair colors
 
     - Bald: Bald hair
     - Black: Black hair
     - Blond: Blond hair
     - Brown: Brown hair
     - Grey: Grey hair
     - Red: Red hair
     - Sandy: Sandy hair
     - White: White hair
 */
public enum HairColor: String {
    case bald
    case black
    case blond
    case brown
    case grey
    case red
    case sandy
    case white
}

// MARK: - Parsing

extension HairColor {
    
    static func of(_ rawValue: String) -> HairColor? {
        switch rawValue {
        case "BAL":
            return .bald
        case "BLK":
            return .black
        case "BLN":
            return .blond
        case "BRO":
            return .brown
        case "GRY":
            return .grey
        case "RED":
            return .red
        case "SDY":
            return .sandy
        case "WHI":
            return .white
        default:
            return nil
        }
    }
}
