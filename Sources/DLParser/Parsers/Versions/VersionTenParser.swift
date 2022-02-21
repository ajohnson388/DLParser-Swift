//
//  VersionTenParser.swift
//  DLParser
//
//  Created by Andrew Johnson on 2/17/22.
//  Copyright © 2022 Andrew Johnson. All rights reserved.
//

import Foundation

/**
    A parser for the AAMVA standard published 2020.
 */
final class VersionTenParser: AAMVAParser {

    override init(data: String) {
        super.init(data: data)
        fields[FieldKey.federalVehicleCode] = nil
        fields[FieldKey.driverLicenseName] = nil
        fields[FieldKey.givenName] = nil
    }
}
