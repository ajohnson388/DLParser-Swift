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
public enum Truncation: String, StringRepresentable {
    case truncated = "T"
    case none = "N"
}
