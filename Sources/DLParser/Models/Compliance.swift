//
//  Compliance.swift
//  DLParser
//
//  Created by Andrew Johnson on 1/2/19.
//  Copyright © 2019 Andrew Johnson. All rights reserved.
//

import Foundation

/**
    The AAMVA standard accepted compliance types as defined in ANSI D-20.
*/
public enum Compliance: String, StringRepresentable {
    
    /// Fully compliant
    case fullyCompliant = "F"
    
    /// Materially compliant
    case materiallyCompliant = "M"
    
    /// Fully compliant
    case nonCompliant = "N"
}
