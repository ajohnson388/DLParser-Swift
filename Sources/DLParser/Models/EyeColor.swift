//
//  EyeColor.swift
//  DLParser
//
//  Created by Andrew Johnson on 3/12/18.
//

import Foundation

/**
     AAMVA standard accepted eye colors.
 */
public enum EyeColor: String, StringRepresentable {
    
    /// Black eyes
    case black = "BLK"
    
    /// Blue eyes
    case blue = "BLU"
    
    /// Brown eyes
    case brown = "BRO"
    
    /// Gray eyes
    case gray = "GRY"
    
    /// Green eyes
    case green = "GRN"
    
    /// Hazel eyes
    case hazel = "HAZ"
    
    /// Maroon eyes
    case maroon = "MAR"
    
    /// Pink eyes
    case pink = "PNK"
    
    /// Dichromatic eyes
    case dichromatic = "DIC"
}
