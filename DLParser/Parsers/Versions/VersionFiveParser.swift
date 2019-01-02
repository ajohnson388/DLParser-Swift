//
//  VersionFiveParser.swift
//  DLParser
//
//  Created by Andrew Johnson on 3/19/18.
//
//

import Foundation

/**
    A parser for the AAMVA standard published 07/2010.
 */
final class VersionFiveFieldParser: AAMVAParser {

    override init(data: String) {
        super.init(data: data)
        fields[FieldKey.isOrganDonor] = nil
        fields[FieldKey.isVeteran] = nil
        fields[FieldKey.federalVehicleCode] = nil
        fields[FieldKey.driverLicenseName] = nil
        fields[FieldKey.givenName] = nil
    }
}
