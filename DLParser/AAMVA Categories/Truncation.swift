//
//  Truncation.swift
//  LicenseParser
//
//  Created by Andrew Johnson on 3/12/18.
//

import Foundation

/**
     AAMVA Name Truncations
 
     - Truncated: The name was truncated
     - None: The name was not truncated
 */
public enum Truncation: String {
    case truncated
    case none
}


// MARK: - Parsing

extension Truncation {
    
    static func of(_ rawValue: String) -> Truncation? {
        switch rawValue {
        case "T":
            return .truncated
        case "N":
            return .none
        default:
            return nil
        }
    }
}
