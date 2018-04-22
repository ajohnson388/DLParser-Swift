//
//  VersionEightFieldParser.swift
//  Pods
//
//  Created by Clayton Lengel-Zigich on 6/10/16.
//
//

import Foundation

/**
    Published 08-2013.
 */
class VersionEightFieldParser: AAMVAParser {
    
    override init(data: String) {
        super.init(data: data)
        fields[FieldKey.fVehicleCode] = nil
        fields[FieldKey.driverLicenseName] = nil
        fields[FieldKey.givenName] = nil
    }
}
