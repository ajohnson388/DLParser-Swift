//
//  FieldKeys.swift
//  DLParser
//
//  Created by Andrew Johnson on 3/12/18.
//

import Foundation

public enum FieldKey: String, Equatable {
    
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
    
    case federalVehicleCode
    case federalCommercialVehicleCode
    
    case standardVehicleCode
    case standardRestrictionCode
    case standardEndorsementCode
    
    case jurisdictionVehicleClass
    case jurisdictionRestrictionCode
    case jurisdictionEndorsementCode
    
    case jurisdictionVehicleClassDescription
    case jurisdictionRestrictionCodeDescription
    case jurisdictionEndorsementCodeDescription
}
