//
//  IssuingCountry.swift
//  LicenseParser
//
//  Created by Andrew Johnson on 3/12/18.
//

import Foundation

/**
    AAMVA Issuing Countries
 
     - UnitedStates: The USA
     - Canda: Canada, eh?
 */
public enum IssuingCountry: String {
    case unitedStates
    case canada
}


// MARK: - Parser

extension IssuingCountry {
    
    static func of(_ rawValue: String) -> IssuingCountry? {
        switch rawValue {
        case "USA":
            return .unitedStates
        case "CAN":
            return .canada
        default:
            return nil
        }
    }
}
