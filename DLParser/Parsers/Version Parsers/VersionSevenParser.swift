//
//  VersionSevenParser.swift
//  DLParserTests
//
//  Created by Andrew Johnson on 3/19/18.
//

import Foundation

/**
    Published 06-2012.
 */
class VersionSevenParser: AAMVAParser {
    
    override init(data: String) {
        super.init(data: data)
        fields[FieldKey.fVehicleCode] = nil
        fields[FieldKey.driverLicenseName] = nil
        fields[FieldKey.givenName] = nil
    }
}
