//
//  IssuingCountry.swift
//  DLParser
//
//  Created by Andrew Johnson on 3/12/18.
//

import Foundation

/**
    AAMVA standard accepted issuing countries.
 */
public enum IssuingCountry: String, StringRepresentable {
    
    /// United States of America
    case unitedStates = "USA"
    
    /// Canada
    case canada = "CAN"
}
