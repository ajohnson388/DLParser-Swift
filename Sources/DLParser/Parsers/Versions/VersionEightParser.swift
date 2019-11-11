//
//  VersionEightParser.swift
//  DLParser
//
//  Created by Andrew Johnson on 3/19/18.
//
//

import Foundation

/**
    A parser for the AAMVA standard published 08/2013.
 */
final class VersionEightFieldParser: AAMVAParser {

    override init(data: String) {
        super.init(data: data)
        fields[FieldKey.federalVehicleCode] = nil
        fields[FieldKey.driverLicenseName] = nil
        fields[FieldKey.givenName] = nil
    }
}
