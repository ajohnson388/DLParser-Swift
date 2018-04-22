//
//  Gender.swift
//  LicenseParser
//
//  Created by Andrew Johnson on 3/12/18.
//

import Foundation

/**
     AAMVA Genders
 
     - Male: Male
     - Female: Female
 */
public enum Gender: String {
    case male
    case female
}


// MARK: - Parsing

extension Gender {
    
    static func of(_ rawValue: String) -> Gender? {
        switch rawValue {
        case "1":
            return .male
        case "2":
            return .female
        default:
            return nil
        }
    }
}
