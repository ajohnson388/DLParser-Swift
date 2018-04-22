//
//  VersionNineParser.swift
//  DLParserTests
//
//  Created by Andrew Johnson on 3/19/18.
//

import Foundation

/**
    Published 2016.
 */
class VersionNineParser: AAMVAParser {
    
    override init(data: String) {
        super.init(data: data)
        fields[FieldKey.fVehicleCode] = nil
        fields[FieldKey.driverLicenseName] = nil
        fields[FieldKey.givenName] = nil
    }
}
