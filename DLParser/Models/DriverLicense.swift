//
//  ParsedDriverLicense.swift
//  LicenseParser
//
//  Created by Andrew Johnson on 3/24/18.
//

import Foundation

public struct DriverLicense {
    
    // MARK: - Names
    
    var firstName: String?
    var middleNames = [String]()
    var lastName: String?
    
    var firstNameAlias: String?
    var givenNameAlias: String?
    var lastNameAlias: String?
    var suffixAlias: String?
    var suffix: NameSuffix?
    var firstNameTruncation: Truncation?
    var middleNameTruncation: Truncation?
    var lastNameTruncation: Truncation?
    
    
    // MARK: - Dates
    
    var expirationDate: Date?
    var issuedDate: Date?
    var birthdate: Date?
    var hazmatExpirationDate: Date?
    var revisionDate: Date?
    
    
    // MARK: - Appearance
    
    var race: String?
    var gender: Gender?
    var eyeColor: EyeColor?
    var height: Double?
    var weight = Weight()
    var hairColor: HairColor?
    
    var placeOfBirth: String?
    var streetAddress: String?
    var streetAddressTwo: String?
    var city: String?
    var state: String?
    var postalCode: String?
    var country: IssuingCountry?
    
    var licenseNumber: String?
    var doucmentId: String?
    var auditInformation: String?
    var inventoryControlNumber: String?
    var complianceType: String?
    var isOrganDonor: Bool?
    var isVeteran: Bool?
    var isTemporaryDocument: Bool?
    
    var federalVehicleCode: String?
    var standardVehicleCode: String?
    var standardRestrictionCode: String?
    var standardEndorsementCode: String?
    
    var jurisdictionVehicleCode: String?
    var jurisdictionRestrictionCode: String?
    var jurisdictionEndorsementCode: String?
    
    var jurisdictionVehicleDescription: String?
    var jurisdictionRestrictionDescription: String?
    var jurisdictionEndorsementDescription: String?
    
    var version: Int?
    var pdf417Data: String?
    
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
        guard let issuedDate = issuedDate else {
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
