//
//  NameSuffix.swift
//  DLParser
//
//  Created by Andrew Johnson on 3/12/18.
//

import Foundation

/**
     AAMVA standard accepted name suffixes.
 */
public enum NameSuffix {
    
    /// Junior
    case junior
    
    /// Senior
    case senior
    
    /// The first
    case first
    
    /// The second
    case second
    
    /// The third
    case third
    
    /// The fourth
    case fourth
    
    /// The fifth
    case fifth
    
    /// The sixth
    case sixth
    
    /// The seventh
    case seventh
    
    /// The eighth
    case eighth
    
    /// The ninth
    case ninth
}


// MARK: - Parsing

extension NameSuffix: StringRepresentable {
    
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
