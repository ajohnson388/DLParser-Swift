//
//  HairColor.swift
//  LicenseParser
//
//  Created by Andrew Johnson on 3/12/18.
//

import Foundation

/**
     AAMVA hair colors
 
     - Bald: Bald hair
     - Black: Black hair
     - Blond: Blond hair
     - Brown: Brown hair
     - Grey: Grey hair
     - Red: Red hair
     - Sandy: Sandy hair
     - White: White hair
 */
public enum HairColor: String, StringRepresentable {
    case bald = "BAL"
    case black = "BLK"
    case blond = "BLN"
    case brown = "BRO"
    case grey = "GRY"
    case red = "RED"
    case sandy = "SDY"
    case white = "WHI"
}
