//
//  MockLicense.swift
//  DLParserTests
//
//  Created by Andrew Johnson on 1/1/19.
//  Copyright © 2019 Andrew Johnson. All rights reserved.
//

import Foundation
import DLParser

struct MockLicenseFactory {
    
    private static func makeDate(_ dateString: String, _ format: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: dateString)!
    }
    
    private static func makeBaseLicense(withDateFormat dateFormat: String = "MMddyyyy") -> DriverLicense {
        var license = DriverLicense()
        license.firstName = "firstName"
        license.middleNames = ["middleName", "middleName"]
        license.lastName = "lastName"
        license.givenNameAlias = "givenNameAlias"
        license.lastNameAlias = "lastNameAlias"
        license.suffixAlias = "suffixAlias"
        license.suffix = NameSuffix.fifth
        license.firstNameTruncation = Truncation.truncated
        license.middleNameTruncation = Truncation.none
        license.lastNameTruncation = Truncation.none
        license.expirationDate = makeDate("11111112", dateFormat)
        license.issueDate = makeDate("11111113", dateFormat)
        license.birthdate = makeDate("11111114", dateFormat)
        license.hazmatExpirationDate = makeDate("11111115", dateFormat)
        license.revisionDate = makeDate("11111116", dateFormat)
        license.race = Race.white
        license.gender = Gender.male
        license.eyeColor = EyeColor.brown
        license.height = 52
        license.weight = Weight(range: WeightRange(rank: 2), pounds: 44)
        license.hairColor = HairColor.black
        license.placeOfBirth = "placeOfBirth"
        license.streetAddress = "streetAddress"
        license.streetAddressTwo = "streetAddressTwo"
        license.city = "city"
        license.state = "state"
        license.postalCode = "12345"
        license.country = IssuingCountry.unitedStates
        license.licenseNumber = "12345678"
        license.documentId = "12345678912345678912"
        license.auditInformation = "auditInformation"
        license.inventoryControlNumber = "123456"
        license.complianceType = Compliance.materiallyCompliant
        license.isOrganDonor = true
        license.isVeteran = false
        license.isTemporaryDocument = false
        license.federalVehicleCode = "32"
        license.standardVehicleClass = "22"
        license.standardRestrictionCode = "12"
        license.standardEndorsementCode = "11"
        license.jurisdictionVehicleClass = "10"
        license.jurisdictionRestrictionCode = "9"
        license.jurisdictionEndorsementCode = "8"
        license.jurisdictionVehicleDescription = "JVD"
        license.jurisdictionRestrictionDescription = "JRD"
        license.jurisdictionEndorsementDescription = "JED"
        license.underEighteenUtilDate = makeDate("11111117", dateFormat)
        license.underNineteenUtilDate = makeDate("11111118", dateFormat)
        license.underTwentyOneUtilDate = makeDate("11111119", dateFormat)
        return license
    }
    
    static var versionOneLicense: DriverLicense {
        var license = makeBaseLicense(withDateFormat: "yyyyMMdd")
        license.version = 1
        license.federalVehicleCode = nil
        license.jurisdictionVehicleClass = nil
        license.jurisdictionRestrictionCode = nil
        license.jurisdictionEndorsementCode = nil
        license.country = nil
        license.lastNameTruncation = nil
        license.firstNameTruncation = nil
        license.middleNameTruncation = nil
        license.placeOfBirth = nil
        license.auditInformation = nil
        license.inventoryControlNumber = nil
        license.weight.range = nil
        license.race = nil
        license.jurisdictionVehicleDescription = nil
        license.jurisdictionEndorsementDescription = nil
        license.jurisdictionRestrictionDescription = nil
        license.complianceType = nil
        license.revisionDate = nil
        license.hazmatExpirationDate = nil
        license.isTemporaryDocument = nil
        license.isVeteran = nil
        license.underEighteenUtilDate = nil
        license.underNineteenUtilDate = nil
        license.underTwentyOneUtilDate = nil
        return license
    }
    
    static var versionTwoLicense: DriverLicense {
        var license = makeBaseLicense()
        license.version = 2
        license.middleNames = []
        license.lastNameTruncation = nil
        license.firstNameTruncation = nil
        license.middleNameTruncation = nil
        license.lastNameAlias = nil
        license.givenNameAlias = nil
        license.suffixAlias = nil
        license.complianceType = nil
        license.revisionDate = nil
        license.hazmatExpirationDate = nil
        license.weight.pounds = nil
        license.isTemporaryDocument = nil
        license.isOrganDonor = nil
        license.isVeteran = nil
        license.underEighteenUtilDate = nil
        license.underNineteenUtilDate = nil
        license.underTwentyOneUtilDate = nil
        return license
    }
    
    static var versionThreeLicense: DriverLicense {
        var license = makeBaseLicense()
        license.version = 3
        license.middleNames = []
        license.lastNameTruncation = nil
        license.firstNameTruncation = nil
        license.middleNameTruncation = nil
        license.complianceType = nil
        license.revisionDate = nil
        license.hazmatExpirationDate = nil
        license.weight.pounds = nil
        license.isTemporaryDocument = nil
        license.isOrganDonor = nil
        license.isVeteran = nil
        license.underEighteenUtilDate = nil
        license.underNineteenUtilDate = nil
        license.underTwentyOneUtilDate = nil
        return license
    }
    
    static var versionFourLicense: DriverLicense {
        var license = makeBaseLicense()
        license.version = 4
        license.isOrganDonor = nil
        license.isVeteran = nil
        license.federalVehicleCode = nil
        return license
    }
    
    static var versionFiveLicense: DriverLicense {
        var license = makeBaseLicense()
        license.version = 5
        license.isOrganDonor = nil
        license.isVeteran = nil
        license.federalVehicleCode = nil
        return license
    }
    
    static var versionSixLicense: DriverLicense {
        var license = makeBaseLicense()
        license.version = 6
        license.isVeteran = nil
        license.federalVehicleCode = nil
        return license
    }
    
    static var versionSevenLicense: DriverLicense {
        var license = makeBaseLicense()
        license.version = 7
        license.federalVehicleCode = nil
        return license
    }
    
    static var versionEightLicense: DriverLicense {
        var license = makeBaseLicense()
        license.version = 8
        license.federalVehicleCode = nil
        return license
    }
    
    static var versionNineLicense: DriverLicense {
        var license = makeBaseLicense()
        license.version = 9
        license.federalVehicleCode = nil
        return license
    }

    static var versionTenLicense: DriverLicense {
        var license = makeBaseLicense()
        license.version = 10
        license.federalVehicleCode = nil
        return license
    }
}
