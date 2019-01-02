//
//  VersionSevenParser.swift
//  DLParser
//
//  Created by Andrew Johnson on 3/19/18.
//

import Foundation

/**
    A parser for the AAMVA standard published 06/2012.
 */
final class VersionSevenParser: AAMVAParser {

    override init(data: String) {
        super.init(data: data)
        fields[FieldKey.federalVehicleCode] = nil
        fields[FieldKey.driverLicenseName] = nil
        fields[FieldKey.givenName] = nil
    }
}
