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
public enum IssuingCountry: String, StringRepresentable {
    case unitedStates = "USA"
    case canada = "CAN"
}
