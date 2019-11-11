//
//  Race.swift
//  DLParser
//
//  Created by Andrew Johnson on 1/2/19.
//  Copyright © 2019 Andrew Johnson. All rights reserved.
//

import Foundation

/**
    AAMVA standard accepted races and ethnicities as definied in the ANSI D-20 standard.
 */
public enum Race: String, StringRepresentable {
    
    /// Alaskan or American Indian
    case americanIndian = "AL"
    
    /// Asian or Pacific Islander
    case asian = "AP"
    
    /// Black ethnicity
    case black = "BK"
    
    /// Hispanic origin
    case hispanic = "H"
    
    /// Non-hispanic
    case nonHispanic = "O"
    
    /// Unknown race or ethnicity
    case unknown = "U"
    
    /// White
    case white = "W"
}
