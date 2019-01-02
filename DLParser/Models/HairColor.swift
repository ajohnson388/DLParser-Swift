//
//  HairColor.swift
//  DLParser
//
//  Created by Andrew Johnson on 3/12/18.
//

import Foundation

/**
     AAMVA standard accepted hair colors.
 */
public enum HairColor: String, StringRepresentable {
    
    /// Bald hair
    case bald = "BAL"
    
    /// Black hair
    case black = "BLK"
    
    /// Blond hair
    case blond = "BLN"
    
    /// Brown hair
    case brown = "BRO"
    
    /// Grey hair
    case grey = "GRY"
    
    /// Red hair
    case red = "RED"
    
    /// Sandy hair
    case sandy = "SDY"
    
    /// White hair
    case white = "WHI"
}
