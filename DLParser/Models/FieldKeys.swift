//
//  FieldKeys.swift
//  LicenseParser
//
//  Created by Andrew Johnson on 3/12/18.
//

import Foundation

public enum FieldKey: String {
    
    // MARK: - Names
    
    case firstName
    case lastName
    case middleName
    
    case driverLicenseName
    case givenName
    
    case lastNameAlias
    case firstNameAlias
    case givenNameAlias
    case suffixAlias
    case suffix
    
    case middleNameTruncation
    case firstNameTruncation
    case lastNameTruncation
    
    
    // MARK: - Dates
    
    case expirationDate
    case issueDate
    case birthDate
    case hazmatExpirationDate
    case revisionDate
    
    
    // MARK: - Appearance
    
    case race
    case gender
    case eyeColor
    case heightInches
    case heightCentimeters
    case hairColor
    case weightRange
    case weightPounds
    case weightKilograms

    
    // MARK: - Address
    
    case placeOfBirth
    case streetAddress
    case streetAddressTwo
    case city
    case state
    case postalCode
    case country

    
    // MARK: - Meta Data
    
    case driverLicenseNumber
    case uniqueDocumentId
    case auditInformation
    case inventoryControlNumber
    case complianceType
    
    case isOrganDonor
    case isVeteran
    case isTemporaryDocument
    
    case fVehicleCode  // f ==> Federal
    
    case sVehicleCode  // s ==> Standard
    case sRestrictionCode
    case sEndorsementCode
    
    case jVehicleClass  // j ==> Jurisdiction
    case jRestrictionCode
    case jEndorsementCode
    
    case jVehicleClassDescription
    case jRestrictionCodeDescription
    case jEndorsementCodeDescription
    
    case federalCommercialVehicleCode
}
