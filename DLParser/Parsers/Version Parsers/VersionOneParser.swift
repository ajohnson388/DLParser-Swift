//
//  VersionOneFieldParser.swift
//  Pods
//
//  Created by Clayton Lengel-Zigich on 6/10/16.
//
//

import Foundation

/**
    Published 2000.
 */
class VersionOneParser: AAMVAParser {
    
    override init(data: String) {
        super.init(data: data)
        fields[FieldKey.jVehicleClass] = nil
        fields[FieldKey.jRestrictionCode] = nil
        fields[FieldKey.jEndorsementCode] = nil
        fields[FieldKey.lastName] = "DAB"
        fields[FieldKey.uniqueDocumentId] = "DBJ"
        fields[FieldKey.country] = nil  // TODO: No documentation?
        fields[FieldKey.lastNameTruncation] = nil
        fields[FieldKey.firstNameTruncation] = nil
        fields[FieldKey.middleNameTruncation] = nil
        fields[FieldKey.placeOfBirth] = nil
        fields[FieldKey.auditInformation] = nil
        fields[FieldKey.inventoryControlNumber] = nil
        fields[FieldKey.lastNameAlias] = "DBO"
        fields[FieldKey.givenNameAlias] = "DBP"
        fields[FieldKey.suffixAlias] = "DBR"
        fields[FieldKey.suffix] = "DAE"
        fields[FieldKey.weightRange] = nil
        fields[FieldKey.race] = nil
        fields[FieldKey.sVehicleCode] = "PAA"
        fields[FieldKey.sEndorsementCode] = "PAF"
        fields[FieldKey.sRestrictionCode] = "PAE"
        fields[FieldKey.jVehicleClassDescription] = nil
        fields[FieldKey.jEndorsementCodeDescription] = nil
        fields[FieldKey.jRestrictionCodeDescription] = nil
        fields[FieldKey.complianceType] = nil
        fields[FieldKey.revisionDate] = nil
        fields[FieldKey.hazmatExpirationDate] = nil
        fields[FieldKey.isTemporaryDocument] = nil
        fields[FieldKey.isOrganDonor] = "DBH"
        fields[FieldKey.isVeteran] = nil
    }
    
    override var unitedStatesDateFormat: String {
        return "yyyyMMdd"
    }

    override var parsedHeight: Double? {
        // Special case for version one where the mixed in|cm string
        // is treated as feet/in
        return parseString(key: FieldKey.heightCentimeters)?.double
            ?? parsedInches
    }
    
    private var parsedInches: Double? {
        guard let feetInches = parseString(key: FieldKey.heightInches),
            feetInches.count == 3 else {
            return nil
        }
        
        let inchesStartIndex = feetInches.index(feetInches.startIndex, offsetBy: 1)
        
        guard
        let feet = feetInches[feetInches.startIndex].string.double,
        let inches = feetInches[inchesStartIndex...feetInches.endIndex].string.double else {
            return nil
        }
        return inches + feet * 12
    }

    override var parsedNameSuffix: NameSuffix? {
        guard let suffix = parseString(key: FieldKey.suffix)
            ?? parseDriverLicenseName(key: FieldKey.suffix) else {
            return nil
        }
        return NameSuffix.of(suffix)
    }

    // TODO: This does not parse out the middle name correctly
    private func parseDriverLicenseName(key: FieldKey) -> String? {
        // Get the name components of the driver license
        guard let driverLicenseName = parseString(key: FieldKey.driverLicenseName) else {
            return nil
        }
        let nameComponents = driverLicenseName.split{ $0 == "," }.map(String.init)

        // Return the name component associated with the key
        switch key {
        case .lastName:
            return nameComponents.first
        case .firstName where nameComponents.count > 2:
            return nameComponents[1]
        case .middleName where nameComponents.count > 3:
            return nameComponents[2]
        case .suffix where nameComponents.count > 4:
            return nameComponents[3]
        default:
            return nil
        }
    }
}
