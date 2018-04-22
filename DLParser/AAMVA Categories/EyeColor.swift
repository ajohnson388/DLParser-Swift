//
//  EyeColor.swift
//  LicenseParser
//
//  Created by Andrew Johnson on 3/12/18.
//

import Foundation

/**
     AAMVA Eye Colors
 
     - Black: Black eyes
     - Blue: Blue eyes
     - Brown: Brown eyes
     - Gray: Gray eyes
     - Green: Green eyes
     - Hazel: Hazel eyes
     - Maroon: Maroon eyes
     - Pink: Pink eyes
     - Dichromatic: Dichromatic eyes
 */
public enum EyeColor: String {
    case black
    case blue
    case brown
    case gray
    case green
    case hazel
    case maroon
    case pink
    case dichromatic
}


// MARK: - Parser

extension EyeColor {
    
    static func of(_ rawValue: String) -> EyeColor? {
        switch rawValue {
        case "BLK":
            return .black
        case "BLU":
            return .blue
        case "BRO":
            return .brown
        case "GRY":
            return .gray
        case "GRN":
            return .green
        case "HAZ":
            return .hazel
        case "MAR":
            return .maroon
        case "PNK":
            return .pink
        case "DIC":
            return .dichromatic
        default:
            return nil
        }
    }
}
