//
//  DriverLicense.swift
//  DLParser
//
//  Created by Andrew Johnson on 3/24/18.
//

import Foundation

/**
    A driver license model for the information described in the AAMVA PDF417 standards. This model
    only captures the subfile 'DL' from the PDF417 data.
 */
public struct DriverLicense: Equatable {
    
    // MARK: - Names
    
    /// The license holder's first name, if any.
    public var firstName: String?
    
    /// The license holder's middle names.
    public var middleNames = [String]()
    
    /// The license holder's last name, if any.
    public var lastName: String?
    
    /// The license holder's alias of the given name, if any.
    public var givenNameAlias: String?
    
    /// The license holder's alias of the last name, if any.
    public var lastNameAlias: String?
    
    /// The license holder's alias of the suffix, if any.
    public var suffixAlias: String?
    
    /// The license holder's suffix, if any.
    public var suffix: NameSuffix?
    
    /// An indication that the first name was truncated, if any.
    public var firstNameTruncation: Truncation?
    
    /// An indication that the middle name was truncated, if any.
    public var middleNameTruncation: Truncation?
    
    /// An indication that the last name was truncated, if any.
    public var lastNameTruncation: Truncation?
    
    
    // MARK: - Dates
    
    /// The expiration date of the license, if any.
    public var expirationDate: Date?
    
    /// The issue date of the license, if any.
    public var issueDate: Date?
    
    /// The license holder's birth date, if any.
    public var birthdate: Date?
    
    /// The hazmat expiration date of the license, if any.
    public var hazmatExpirationDate: Date?
    
    /// The revision date of the license, if any.
    public var revisionDate: Date?
    
    
    // MARK: - Appearance
    
    /// The license holder's race, if any.
    public var race: Race?
    
    /// The license holder's gender, if any.
    public var gender: Gender?
    
    /// The license holder's eye color, if any.
    public var eyeColor: EyeColor?
    
    /// The license holder's height in centimeters, if any.
    public var height: Double?
    
    /// The license holder's exact weight or weight range, if any.
    public var weight = Weight()
    
    /// The license holder's hair color, if any.
    public var hairColor: HairColor?
    
    
    // MARK: - Location
    
    /// The license holder's place of birth, if any.
    public var placeOfBirth: String?
    
    /// The license holder's street address, if any.
    public var streetAddress: String?
    
    /// The license holder's street address line two, if any.
    public var streetAddressTwo: String?
    
    /// The license holder's city, if any.
    public var city: String?
    
    /// The license holder's state, if any.
    public var state: String?
    
    /// The license holder's postal code, if any.
    public var postalCode: String?
    
    /// The license holder's country, if any.
    public var country: IssuingCountry?
    
    
    // MARK: - Meta Data
    
    /// The AAMVA version used in the driver license PDF417 data.
    public var version: Int?
    
    /// The UTF-8 data encoded in the PDF417 barcode.
    public var pdf417Data: String?
    
    /// The license holder's driver license number, if any.
    public var licenseNumber: String?
    
    /// The license holder's issued document id, if any.
    public var documentId: String?
    
    /// The license holder's audit information, if any.
    public var auditInformation: String?
    
    /// The license holder's inventory control number, if any.
    public var inventoryControlNumber: String?
    
    /// The license holder's compliance type, if any.
    public var complianceType: Compliance?
    
    /// The license holder's organ donor status, if any.
    public var isOrganDonor: Bool?
    
    /// The license holder's veteran status, if any.
    public var isVeteran: Bool?
    
    /// The license holder's temporary document status, if any.
    public var isTemporaryDocument: Bool?
    
    
    // MARK: - Codes
    
    /// The license holder's federal vehicle code, if any.
    public var federalVehicleCode: String?
    
    /// The license holder's standard vehicle class, if any.
    public var standardVehicleClass: String?
    
    /// The license holder's standard restriction code, if any.
    public var standardRestrictionCode: String?
    
    /// The license holder's standard endorsement code, if any.
    public var standardEndorsementCode: String?
    
    /// The license holder's jurisdiction vehicle class, if any.
    public var jurisdictionVehicleClass: String?
    
    /// The license holder's jurisdiction restriction code, if any.
    public var jurisdictionRestrictionCode: String?
    
    /// The license holder's jurisdiction endorsement code, if any.
    public var jurisdictionEndorsementCode: String?
    
    /// The license holder's jurisdiction vehicle description, if any.
    public var jurisdictionVehicleDescription: String?
    
    /// The license holder's jurisdiction restriction description, if any.
    public var jurisdictionRestrictionDescription: String?
    
    /// The license holder's jurisdiction endorsement description, if any.
    public var jurisdictionEndorsementDescription: String?
    
    
    /// Creates an empty driver license.
    public init() {}
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
    
    /**
        Determines if the license holder is 18 or older.
     
        Returns: True if the license holder is 18 or older.
     */
    public var isJuvenile: Bool {
        var component = DateComponents()
        component.year = -18
        
        guard
        let birthDate = birthdate,
        let calculatedDate = Calendar.current.date(byAdding: component, to: Date()) else {
            return true
        }
        return calculatedDate >= birthDate
    }
}
