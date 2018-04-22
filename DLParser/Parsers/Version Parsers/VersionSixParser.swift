//
//  VersionSixParser.swift
//  DLParserTests
//
//  Created by Andrew Johnson on 3/19/18.
//

import Foundation

/**
    Published 07-2011.
 */
class VersionSixParser: AAMVAParser {
    
    override init(data: String) {
        super.init(data: data)
        fields[FieldKey.isVeteran] = nil
        fields[FieldKey.fVehicleCode] = nil
        fields[FieldKey.driverLicenseName] = nil
        fields[FieldKey.givenName] = nil
    }
}
