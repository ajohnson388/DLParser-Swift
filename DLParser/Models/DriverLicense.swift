//
//  ParsedDriverLicense.swift
//  LicenseParser
//
//  Created by Andrew Johnson on 3/24/18.
//

import Foundation

public struct DriverLicense {
    
    // MARK: - Names
    
    public var firstName: String?
    public var middleNames = [String]()
    public var lastName: String?
    
    public var firstNameAlias: String?
    public var givenNameAlias: String?
    public var lastNameAlias: String?
    public var suffixAlias: String?
    public var suffix: NameSuffix?
    public var firstNameTruncation: Truncation?
    public var middleNameTruncation: Truncation?
    public var lastNameTruncation: Truncation?
    
    
    // MARK: - Dates
    
    public var expirationDate: Date?
    public var issueDate: Date?
    public var birthdate: Date?
    public var hazmatExpirationDate: Date?
    public var revisionDate: Date?
    
    
    // MARK: - Appearance
    
    public var race: String?
    public var gender: Gender?
    public var eyeColor: EyeColor?
    public var height: Double?
    public var weight = Weight()
    public var hairColor: HairColor?
    
    public var placeOfBirth: String?
    public var streetAddress: String?
    public var streetAddressTwo: String?
    public var city: String?
    public var state: String?
    public var postalCode: String?
    public var country: IssuingCountry?
    
    public var licenseNumber: String?
    public var documentId: String?
    public var auditInformation: String?
    public var inventoryControlNumber: String?
    public var complianceType: String?
    public var isOrganDonor: Bool?
    public var isVeteran: Bool?
    public var isTemporaryDocument: Bool?
    
    public var federalVehicleCode: String?
    public var standardVehicleCode: String?
    public var standardRestrictionCode: String?
    public var standardEndorsementCode: String?
    
    public var jurisdictionVehicleCode: String?
    public var jurisdictionRestrictionCode: String?
    public var jurisdictionEndorsementCode: String?
    
    public var jurisdictionVehicleDescription: String?
    public var jurisdictionRestrictionDescription: String?
    public var jurisdictionEndorsementDescription: String?
    
    public var version: Int?
    public var pdf417Data: String?
    
}


// MARK - Conditional Properties

extension DriverLicense {
    
    /**
        Determines if the license is expired based on the `expirationDate`
     
        Returns: True when the current date is past the expiration date, false otherwise.
     */
    public var isExpired: Bool {
        guard let expirationDate = expirationDate else {
            return false
        }
        return Date() > expirationDate
    }
    
    /**
        Determines if the license has been issued based on the `issueDate`
     
        Returns: True when the current date is past the issue date, false otherwise.
     */
    public var isIssued: Bool {
        guard let issuedDate = issueDate else {
            return false
        }
        return Date() > issuedDate
    }
    
    /**
        Determines if enough of the license data is present to be useful for most things.
     
        Returns: True when a set of essential properties are non-empty, false otherwise.
     */
    public var isAcceptable: Bool {
        return licenseNumber != nil
    }
    
    public var isJuvenile: Bool {
        var component = DateComponents()
        component.year = -18
        
        guard
        let birthDate = birthdate,
        let calculatedDate = Calendar.current
            .date(byAdding: component, to: Date()) else {
            return true
        }
        return calculatedDate >= birthDate
    }
}
