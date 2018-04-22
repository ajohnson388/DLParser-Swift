//
//  ReservedKeywords.swift
//  LicenseParser
//
//  Created by Andrew Johnson on 3/18/18.
//

import Foundation


enum ReservedKeywords: String {
    
    /**
        A 2D symbol encoded according to the rules of this standard
        shall include a Compliance Indicator. The Compliance Indicator
        as defined by this standard is the Commercial At Sign (“@”)
        (ASCII/ISO 646 Decimal “64”) (ASCII/ISO 646 Hex “40”). The
        Compliance Indicator is the first character of the symbol.
     */
    case complianceIndicator = "@"
    
    /**
         The Data Element Separator is used in this standard to indicate
         that a new data element is to follow, and that the current field
         is terminated. Whenever a Data Element Separator is encountered
         (within a Subfile type which uses Data Element Separators),
         the next character(s) shall either be a Segment Terminator or
         shall define the contents of the next field according to the
         template of the specific Subfile. The Data Element Separator as
         definedbythisstandardistheLineFeedcharacter(“L ”ASCII/ISO646
         is the second character of the symbol.
     */
    case dataElementSeperator = "\n"
    
    /**
        The Record Separator as defined by this standard is the
        Record Separator character (“R ” ASCII/ISO 646 S Decimal “30”)
        (ASCII/ISO 646 Hex “1E”). As this report is presented
        for ratification, there is no special case defined for when this
        field will be used. It is embodied within the recommendation for
        future growth. The Record Separator is the third character of
        the symbol and shall always be reflected within the header in
        a compliant symbol.
     */
    case recordSeperator = "\u{1e}"
    
    /**
        As used in this standard the Segment T erminator is used to
        end Subfiles where Field Identifiers are employed. The Segment
        Terminator as defined by this standard is the Carriage Return
        character (“C ” ASCII/ISO 646 Decimal “13”) R
        (ASCII/ISO 646 Hex “0D”). The Segment Terminator is the fourth
        character of the symbol.
     */
    case segmentTerminator = "\r"
    
    /**
        This is the designator that identifies the file as an AAMVA
        compliant format. The designator is defined as the 5 byte upper
        character string “ANSI “, with a blank space after the fourth
        character.
     */
    case fileType = "ANSI "
    
    /**
        This is the designator that identifies what type of data is
        contained in this portion of the file. The 2 character uppercase
        character field “DL” is the designator for Drivers License
        Subfile type containing Required and Optional data elements as
        defined in Sections 6.2, E.4.4.1 and E.4.4.2. Any jurisdiction
        has the right to define a Subfile Type to contain jurisdiction
        specific information provided that the Subfile type is a 2
        character uppercase character field whose first character is “Z”.
     */
    enum SubfileDesignator: String {
        /// Driver license
        case dl = "DL"
        
        /// Jurisdiction defined
        case zv = "ZV"
    }
}
