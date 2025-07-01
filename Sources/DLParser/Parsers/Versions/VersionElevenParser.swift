//
//  VersionElevenParser.swift
//  DLParser
//
//  Created by Andy Johnson on 6/30/25.
//  Copyright © 2025 Andrew Johnson. All rights reserved.
//

import Foundation

/**
    A parser for the AAMVA standard published 2025.
 */
final class VersionElevenParser: AAMVAParser {

    override init(data: String) {
        super.init(data: data)
        fields[FieldKey.federalVehicleCode] = nil
        fields[FieldKey.driverLicenseName] = nil
        fields[FieldKey.givenName] = nil
        fields[FieldKey.lastNameAlias] = nil
        fields[FieldKey.givenNameAlias] = nil
        fields[FieldKey.suffixAlias] = nil
        fields[FieldKey.race] = nil
        fields[FieldKey.hazmatExpirationDate] = nil
        fields[FieldKey.isCommercial] = "DDM"
        fields[FieldKey.isNonDomiciled] = "DDN"
        fields[FieldKey.isEnhancedCredential] = "DDO"
        fields[FieldKey.isPermit] = "DDP"
    }
}
