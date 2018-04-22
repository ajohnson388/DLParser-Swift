//
//  VersionFourParser.swift
//  Pods
//
//  Created by Clayton Lengel-Zigich on 6/15/16.
//
//

import Foundation

/**
    Published 07-2009.
 */
class VersionFourFieldParser: AAMVAParser {
    
    override init(data: String) {
        super.init(data: data)
        fields[FieldKey.isOrganDonor] = nil
        fields[FieldKey.isVeteran] = nil
        fields[FieldKey.fVehicleCode] = nil
        fields[FieldKey.driverLicenseName] = nil
        fields[FieldKey.givenName] = nil
    }
}
