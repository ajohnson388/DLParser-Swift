//
//  AAMVAParser.swift
//  DLParser
//
//  Created by Andrew Johnson on 3/19/18.
//
//

import Foundation

/**
    An abstract factory and base class for parsing driver license data
    that is AAMVA compliant. The class is responsible for parsing data
    on the detected version number.
*/
public class AAMVAParser {
    
    // MARK: - Properties

    /**
        The base fields common to all or most version standards. This
        field should be modified in subclasses for version-specific
        field changes.
     */
    final var fields: [FieldKey: String] = [
        FieldKey.jurisdictionVehicleClass: "DCA",
        FieldKey.jurisdictionRestrictionCode: "DCB",
        FieldKey.jurisdictionEndorsementCode: "DCD",
        FieldKey.expirationDate: "DBA",
        FieldKey.issueDate: "DBD",
        FieldKey.firstName: "DAC",
        FieldKey.middleName: "DAD",
        FieldKey.lastName: "DCS",
        FieldKey.birthDate: "DBB",
        FieldKey.gender: "DBC",
        FieldKey.eyeColor: "DAY",
        FieldKey.heightInches: "DAU",
        FieldKey.heightCentimeters: "DAV",
        FieldKey.streetAddress: "DAG",
        FieldKey.city: "DAI",
        FieldKey.state: "DAJ",
        FieldKey.postalCode: "DAK",
        FieldKey.driverLicenseNumber: "DAQ",
        FieldKey.uniqueDocumentId: "DCF",
        FieldKey.country: "DCG",
        FieldKey.lastNameTruncation: "DDE",
        FieldKey.firstNameTruncation: "DDF",
        FieldKey.middleNameTruncation: "DDG",
        FieldKey.streetAddressTwo: "DAH",
        FieldKey.hairColor: "DAZ",
        FieldKey.placeOfBirth: "DCI",
        FieldKey.auditInformation: "DCJ",
        FieldKey.inventoryControlNumber: "DCK",
        FieldKey.lastNameAlias: "DBN",
        FieldKey.givenNameAlias: "DBG",
        FieldKey.suffixAlias: "DBS",
        FieldKey.suffix: "DCU",
        FieldKey.weightRange: "DCE",
        FieldKey.race: "DCL",
        FieldKey.standardVehicleCode: "DCM",
        FieldKey.standardEndorsementCode: "DCN",
        FieldKey.standardRestrictionCode: "DCO",
        FieldKey.jurisdictionVehicleClassDescription: "DCP",
        FieldKey.jurisdictionEndorsementCodeDescription: "DCQ",
        FieldKey.jurisdictionRestrictionCodeDescription: "DCR",
        FieldKey.complianceType: "DDA",
        FieldKey.revisionDate: "DDB",
        FieldKey.hazmatExpirationDate: "DDC",
        FieldKey.weightPounds: "DAW",
        FieldKey.weightKilograms: "DAX",
        FieldKey.isTemporaryDocument: "DDD",
        FieldKey.isOrganDonor: "DDK",
        FieldKey.isVeteran: "DDL",
        FieldKey.federalVehicleCode: "DCH",
        FieldKey.driverLicenseName: "DAA",
        FieldKey.givenName: "DCT",
        FieldKey.underEighteenUntilDate: "DDH",
        FieldKey.underNineteenUntilDate: "DDI",
        FieldKey.underTwentyOneUntilDate: "DDJ",
    ]

    /// The raw data from an AAMVA specification adhering to the PDF-417 barcode standard.
    final let data: String
    
    /**
        The version number detected in the driver license data or nil
        if the data is not AAMVA compliant.
     */
    final var versionNumber: Int? {
        let pattern = "\\d{6}(\\d{2})\\w+"
        guard let match = NSRegularExpression.firstMatch(pattern: pattern,
                                                         data: data) as NSString? else {
            return nil
        }
        return match.integerValue
    }
    
    /// The number of subfiles found in the driver license data.
    final var subfileCount: Int? {
        let match = NSRegularExpression.firstMatch(pattern: "\\d{8}(\\d{2})\\w+",
                                                   data: data) as NSString?
        return match?.integerValue
    }
    
    /**
        The date format used for cards issued in the United States.
        This field should be modified in subclasses for version-specific
        date format changes.
    */
    var unitedStatesDateFormat: String {
        return "MMddyyyy"
    }
    
    /**
        The date format used for cards issued in Canada. This field
        should be modified in subclasses for version-specific date
        format changes.
    */
    var canadaDateFormat: String {
        return "yyyyMMdd"
    }
    
    /// The date format determined by the PDF417 data's country field.
    final var dateFormat: String {
        guard let country: IssuingCountry = parseCategory(key: FieldKey.country) else {
            return unitedStatesDateFormat
        }
        
        switch country {
        case .unitedStates:
            return unitedStatesDateFormat
        case .canada:
            return canadaDateFormat
        }
    }
    
    private var versionParser: AAMVAParser {
        let defaultParser = AAMVAParser(data: data)
        guard let version = versionNumber else {
            return defaultParser
        }
        
        switch version {
        case 1:  return VersionOneParser(data: data)
        case 2:  return VersionTwoFieldParser(data: data)
        case 3:  return VersionThreeFieldParser(data: data)
        case 4:  return VersionFourFieldParser(data: data)
        case 5:  return VersionFiveFieldParser(data: data)
        case 8:  return VersionEightFieldParser(data: data)
        case 9:  return VersionNineParser(data: data)
        default: return defaultParser
        }
    }

    
    // MARK: - Object Lifecycle
    
    /**
        Initializes a new a driver license parser with the given license data.
     
        - parameters:
            - data: The PDF417 data string that was decoded from the barcode.
     */
    public init(data: String) {
        self.data = data
    }
    
    
    // MARK: - Public Methods
    
    /**
        Parses the AAMVA PDF417 raw barcode data based on the specific AAMVA document version.
     
        - Returns: A ParsedLicense with all available parsed fields.
     */
    public func parse() -> DriverLicense {
        let version = versionNumber
        let parser = self.versionParser
        var license = DriverLicense()
        license.firstName = parser.parsedFirstName
        license.middleNames = parser.parsedMiddleNames
        license.lastName = parser.parsedLastName
        license.givenNameAlias = parser.parseString(key: FieldKey.givenNameAlias)
        license.lastNameAlias = parser.parseString(key: FieldKey.lastNameAlias)
        license.suffixAlias = parser.parseString(key: FieldKey.suffixAlias)
        license.suffix = parser.parsedNameSuffix
        license.firstNameTruncation = parser.parseCategory(key: FieldKey.firstNameTruncation)
        license.middleNameTruncation = parser.parseCategory(key: FieldKey.middleNameTruncation)
        license.lastNameTruncation = parser.parseCategory(key: FieldKey.lastNameTruncation)
        license.expirationDate = parser.parseDate(key: FieldKey.expirationDate)
        license.issueDate = parser.parseDate(key: FieldKey.issueDate)
        license.birthdate = parser.parseDate(key: FieldKey.birthDate)
        license.hazmatExpirationDate = parser.parseDate(key: FieldKey.hazmatExpirationDate)
        license.revisionDate = parser.parseDate(key: FieldKey.revisionDate)
        license.underEighteenUtilDate = parseDate(key: FieldKey.underEighteenUntilDate)
        license.underNineteenUtilDate = parseDate(key: FieldKey.underNineteenUntilDate)
        license.underTwentyOneUtilDate = parseDate(key: FieldKey.underTwentyOneUntilDate)
        license.race = parser.parseCategory(key: FieldKey.race)
        license.gender = parser.parseCategory(key: FieldKey.gender)
        license.eyeColor = parser.parseCategory(key: FieldKey.eyeColor)
        license.height = parser.parsedHeight
        license.weight = parser.parsedWeight
        license.hairColor = parser.parseCategory(key: FieldKey.hairColor)
        license.placeOfBirth = parser.parseString(key: FieldKey.placeOfBirth)
        license.streetAddress = parser.parseString(key: FieldKey.streetAddress)
        license.streetAddressTwo = parser.parseString(key: FieldKey.streetAddressTwo)
        license.city = parser.parseString(key: FieldKey.city)
        license.state = parser.parseString(key: FieldKey.state)
        license.postalCode = parser.parseString(key: FieldKey.postalCode)
        license.country = parser.parseCategory(key: FieldKey.country)
        license.licenseNumber = parser.parseString(key: FieldKey.driverLicenseNumber)
        license.documentId = parser.parseString(key: FieldKey.uniqueDocumentId)
        license.auditInformation = parser.parseString(key: FieldKey.auditInformation)
        license.inventoryControlNumber = parser.parseString(key: FieldKey.inventoryControlNumber)
        license.complianceType = parser.parseCategory(key: FieldKey.complianceType)
        license.isOrganDonor = parser.parseBoolean(key: FieldKey.isOrganDonor)
        license.isVeteran = parser.parseBoolean(key: FieldKey.isVeteran)
        license.isTemporaryDocument = parser.parseBoolean(key: FieldKey.isTemporaryDocument)
        license.federalVehicleCode = parser.parseString(key: FieldKey.federalVehicleCode)
        license.standardVehicleClass = parser.parseString(key: FieldKey.standardVehicleCode)
        license.standardRestrictionCode = parser.parseString(key: FieldKey.standardRestrictionCode)
        license.standardEndorsementCode = parser.parseString(key: FieldKey.standardEndorsementCode)
        license.jurisdictionVehicleClass = parser.parseString(key: FieldKey.jurisdictionVehicleClass)
        license.jurisdictionRestrictionCode = parser.parseString(key: FieldKey.jurisdictionRestrictionCode)
        license.jurisdictionEndorsementCode = parser.parseString(key: FieldKey.jurisdictionEndorsementCode)
        license.jurisdictionVehicleDescription = parser.parseString(key: FieldKey.jurisdictionVehicleClassDescription)
        license.jurisdictionRestrictionDescription = parser.parseString(key: FieldKey.jurisdictionRestrictionCodeDescription)
        license.jurisdictionEndorsementDescription = parser.parseString(key: FieldKey.jurisdictionEndorsementCodeDescription)
        license.version = version
        license.pdf417Data = data
        return license
    }

    
    // MARK: - Generic Parsing

    func parseString(key: FieldKey) -> String? {
        guard let identifier = fields[key] else {
            return nil
        }
        
        // Check for field by searching for the beginning carriage return or the beginning of the DL subfile
        return NSRegularExpression.firstMatch(pattern: "\n\(identifier)(.*?)\\n", data: data)
            ?? NSRegularExpression.firstMatch(pattern: "DL\(identifier)(.*?)\\n", data: data)
    }
    
    func parseDouble(key: FieldKey) -> Double? {
        return parseString(key: key)?.double
    }
    
    func parseBoolean(key: FieldKey) -> Bool? {
        guard let value = parseString(key: key) else {
            return nil
        }
        return value == "1"
    }
    
    func parseDate(key: FieldKey) -> Date? {
        guard let dateString = parseString(key: key),
            !dateString.isEmpty else {
            return nil
        }

        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        return formatter.date(from: dateString)
    }
    
    func parseCategory<Category>(key: FieldKey) -> Category? where Category: StringRepresentable {
        guard let rawValue = parseString(key: key) else {
            return nil
        }
        return Category.of(rawValue)
    }
    
    
    // MARK: - Field Parsing
    
    var parsedFirstName: String? {
        return parseString(key: FieldKey.firstName)
            ?? parseString(key: FieldKey.givenName)?.trimmedSplitByComma.first
            ?? parseString(key: FieldKey.driverLicenseName)?.trimmedSplitByComma.first
    }
    
    var parsedMiddleNames: [String] {
        if let middleNames = parseString(key: FieldKey.middleName)?.trimmedSplitByComma {
            return middleNames
        }
        
        if let givenName = parseString(key: FieldKey.givenName) {
            let parts = givenName.trimmedSplitByComma.dropFirst()
            return Array(parts)
        }
        
        if let driveLicenseName = parseString(key: FieldKey.driverLicenseName) {
            let parts = driveLicenseName.trimmedSplitByComma.dropFirst().dropLast()
            return Array(parts)
        }
        
        return []
    }
    
    var parsedLastName: String? {
        return parseString(key: FieldKey.lastName)
            ?? parseString(key: FieldKey.driverLicenseName)?.trimmedSplitByComma.last
    }

    var parsedNameSuffix: NameSuffix? {
        return parseCategory(key: FieldKey.suffix)
    }
    
    /// Returns the height in inches.
    var parsedHeight: Double? {
        guard
        let heightString = parseString(key: FieldKey.heightInches)?.split(separator: " ").first,
        let height = Double(heightString) else {
            return nil
        }
        
        return heightString.contains("cm")
            ? UnitConverter.inches(from: height) : height
    }
    
    /// Returns the weight range or exact weight.
    var parsedWeight: Weight {
        var weight = Weight()
        
        if let pounds = parseString(key: FieldKey.weightPounds)?.double {
            weight.pounds = pounds
        } else if let kilograms = parseString(key: FieldKey.weightKilograms)?.double {
            weight.pounds = UnitConverter.pounds(from: kilograms)
        }
        
        if let weightRangeRank = parseString(key: FieldKey.weightRange)?.double {
            weight.range = WeightRange(rank: Int(weightRangeRank))
        }
        return weight
    }
}
