//
//  NameSuffix.swift
//  LicenseParser
//
//  Created by Andrew Johnson on 3/12/18.
//

import Foundation

/**
     AAMVA Name Suffixes
 
     - Junior: Junior, Jr.
     - Senior: Senior, Sr.
     - First: First, I, 1st
     - Second: Second, II, 2nd
     - Third: Third, III, 3rd
     - Fourth: Fourth, IV, 4th
     - Fifth: Fifth, V, 5th
     - Sixth: Sixth, VI, 6th
     - Seventh: Seventh, VII, 7th
     - Eighth: Eighth, VIII, 8th
     - Ninth: Ninth, IX, 9th
 */
public enum NameSuffix: String {
    case junior
    case senior
    case first
    case second
    case third
    case fourth
    case fifth
    case sixth
    case seventh
    case eighth
    case ninth
}


// MARK: - Parsing

extension NameSuffix {
    
    static func of(_ rawValue: String) -> NameSuffix? {
        switch rawValue {
        case "JR":
            return .junior
        case "SR":
            return .senior
        case "1ST", "I":
            return .first
        case "2ND", "II":
            return .second
        case "3RD", "III":
            return .third
        case "4TH", "IV":
            return .fourth
        case "5TH", "V":
            return .fifth
        case "6TH", "VI":
            return .sixth
        case "7TH", "VII":
            return .seventh
        case "8TH", "VIII":
            return .eighth
        case "9TH", "IX":
            return .ninth
        default:
            return nil
        }
    }
}
