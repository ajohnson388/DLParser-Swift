//
//  EyeColor.swift
//  LicenseParser
//
//  Created by Andrew Johnson on 3/12/18.
//

import Foundation

/**
     AAMVA Eye Colors
 
     - Black: Black eyes
     - Blue: Blue eyes
     - Brown: Brown eyes
     - Gray: Gray eyes
     - Green: Green eyes
     - Hazel: Hazel eyes
     - Maroon: Maroon eyes
     - Pink: Pink eyes
     - Dichromatic: Dichromatic eyes
 */
public enum EyeColor: String, StringRepresentable {
    case black = "BLK"
    case blue = "BLU"
    case brown = "BRO"
    case gray = "GRY"
    case green = "GRN"
    case hazel = "HAZ"
    case maroon = "MAR"
    case pink = "PNK"
    case dichromatic = "DIC"
}
