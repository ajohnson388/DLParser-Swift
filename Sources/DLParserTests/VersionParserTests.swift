//
//  VersionParserTests.swift
//  DLParserTests
//
//  Created by Andrew Johnson on 1/1/19.
//  Copyright © 2019 Andrew Johnson. All rights reserved.
//

import Foundation
import XCTest
@testable import DLParser

/**
    A test suite for all of the version parsers. Asserts the version parsers accurately parse
    the PDF417 data into the expected mock licenses.
 */
final class VersionParserTests: XCTestCase {
    
    private func testVersionParser(mockLicense: DriverLicense, licenseDataString: String) {
        var actualLicense = AAMVAParser(data: licenseDataString).parse()
        actualLicense.pdf417Data = nil  // Remove PDF417 data since we won't have it in the mock
        XCTAssertEqual(mockLicense, actualLicense)
    }
    
    func testVersionOneParser() {
        testVersionParser(mockLicense: MockLicenseFactory.versionOneLicense, licenseDataString: "@\n\u{1e}\rANSI 123456010201DL00000355DLPAA22\nPAE12\nPAF11\nDBH1\nDBJ12345678912345678912\nDBOlastNameAlias\nDBA11111112\nDBC1\nDBB11111114\nDBD11111113\nDBPgivenNameAlias\nDBRsuffixAlias\nDADmiddleName, middleName\nDAE5TH\nDAGstreetAddress\nDAAfirstName\nDABlastName\nDACfirstName\nDAHstreetAddressTwo\nDAIcity\nDAJstate\nDAK12345\nDAU052\nDAW44\nDAQ12345678\nDAX44\nDAYBRO\nDAZBLK\n\r")
    }
    
    func testVersionTwoParser() {
        testVersionParser(mockLicense: MockLicenseFactory.versionTwoLicense, licenseDataString: "@\n\u{1e}\rANSI 123456020201DL00000356DLDCN11\nDCO12\nDCLW\nDCM22\nDCJauditInformation\nDCK123456\nDCH32\nDCIplaceOfBirth\nDCF12345678912345678912\nDCGUSA\nDCD8\nDCE2\nDCB9\nDCA10\nDCTfirstName\nDCU5TH\nDCRJRD\nDCSlastName\nDCPJVD\nDCQJED\nDBA11111112\nDBC1\nDBB11111114\nDBD11111113\nDAGstreetAddress\nDAHstreetAddressTwo\nDAIcity\nDAJstate\nDAK12345\nDAU052\nDAQ12345678\nDAYBRO\nDAZBLK\n\r")
    }
    
    func testVersionThreeParser() {
        testVersionParser(mockLicense: MockLicenseFactory.versionThreeLicense, licenseDataString: "@\n\u{1e}\rANSI 123456030201DL00000409DLDCN11\nDCO12\nDCLW\nDCM22\nDCJauditInformation\nDCK123456\nDCH32\nDCIplaceOfBirth\nDCF12345678912345678912\nDCGUSA\nDCD8\nDCE2\nDCB9\nDCA10\nDCTfirstName\nDCU5TH\nDCRJRD\nDCSlastName\nDCPJVD\nDCQJED\nDBNlastNameAlias\nDBA11111112\nDBC1\nDBB11111114\nDBD11111113\nDBGgivenNameAlias\nDBSsuffixAlias\nDAGstreetAddress\nDAHstreetAddressTwo\nDAIcity\nDAJstate\nDAK12345\nDAU052\nDAQ12345678\nDAYBRO\nDAZBLK\n\r")
    }
    
    func testVersionFourParser() {
        testVersionParser(mockLicense: MockLicenseFactory.versionFourLicense, licenseDataString: "@\n\u{1e}\rANSI 123456040201DL00000499DLDCN11\nDCO12\nDCLW\nDCM22\nDCJauditInformation\nDCK123456\nDCIplaceOfBirth\nDCF12345678912345678912\nDCGUSA\nDCD8\nDCE2\nDCB9\nDCA10\nDCU5TH\nDCRJRD\nDCSlastName\nDCPJVD\nDCQJED\nDBNlastNameAlias\nDBA11111112\nDBC1\nDBB11111114\nDBD11111113\nDBGgivenNameAlias\nDBSsuffixAlias\nDADmiddleName, middleName\nDAGstreetAddress\nDACfirstName\nDAHstreetAddressTwo\nDAIcity\nDAJstate\nDAK12345\nDAU052\nDAW44\nDAQ12345678\nDAX44\nDAYBRO\nDAZBLK\nDDC11111115\nDDB11111116\nDDAM\nDDGN\nDDFT\nDDEN\nDDD0\nDDH11111117\nDDI11111118\nDDJ11111119\n\r")
    }

    
    func testVersionFiveParser() {
        testVersionParser(mockLicense: MockLicenseFactory.versionFiveLicense, licenseDataString: "@\n\u{1e}\rANSI 123456050201DL00000499DLDCN11\nDCO12\nDCLW\nDCM22\nDCJauditInformation\nDCK123456\nDCIplaceOfBirth\nDCF12345678912345678912\nDCGUSA\nDCD8\nDCE2\nDCB9\nDCA10\nDCU5TH\nDCRJRD\nDCSlastName\nDCPJVD\nDCQJED\nDBNlastNameAlias\nDBA11111112\nDBC1\nDBB11111114\nDBD11111113\nDBGgivenNameAlias\nDBSsuffixAlias\nDADmiddleName, middleName\nDAGstreetAddress\nDACfirstName\nDAHstreetAddressTwo\nDAIcity\nDAJstate\nDAK12345\nDAU052\nDAW44\nDAQ12345678\nDAX44\nDAYBRO\nDAZBLK\nDDC11111115\nDDB11111116\nDDAM\nDDGN\nDDFT\nDDEN\nDDD0\nDDH11111117\nDDI11111118\nDDJ11111119\n\r")
    }
    
    func testVersionSixParser() {
        testVersionParser(mockLicense: MockLicenseFactory.versionSixLicense, licenseDataString: "@\n\u{1e}\rANSI 123456060201DL00000505DLDCN11\nDCO12\nDCLW\nDCM22\nDCJauditInformation\nDCK123456\nDCIplaceOfBirth\nDCF12345678912345678912\nDCGUSA\nDCD8\nDCE2\nDCB9\nDCA10\nDCU5TH\nDCRJRD\nDCSlastName\nDCPJVD\nDCQJED\nDBNlastNameAlias\nDBA11111112\nDBC1\nDBB11111114\nDBD11111113\nDBGgivenNameAlias\nDBSsuffixAlias\nDADmiddleName, middleName\nDAGstreetAddress\nDACfirstName\nDAHstreetAddressTwo\nDAIcity\nDAJstate\nDAK12345\nDAU052\nDAW44\nDAQ12345678\nDAX44\nDAYBRO\nDAZBLK\nDDK1\nDDC11111115\nDDB11111116\nDDAM\nDDGN\nDDFT\nDDEN\nDDD0\nDDH11111117\nDDI11111118\nDDJ11111119\n\r")
    }
    
    func testVersionSevenParser() {
        testVersionParser(mockLicense: MockLicenseFactory.versionSevenLicense, licenseDataString: "@\n\u{1e}\rANSI 123456070201DL00000511DLDCN11\nDCO12\nDCLW\nDCM22\nDCJauditInformation\nDCK123456\nDCIplaceOfBirth\nDCF12345678912345678912\nDCGUSA\nDCD8\nDCE2\nDCB9\nDCA10\nDCU5TH\nDCRJRD\nDCSlastName\nDCPJVD\nDCQJED\nDBNlastNameAlias\nDBA11111112\nDBC1\nDBB11111114\nDBD11111113\nDBGgivenNameAlias\nDBSsuffixAlias\nDADmiddleName, middleName\nDAGstreetAddress\nDACfirstName\nDAHstreetAddressTwo\nDAIcity\nDAJstate\nDAK12345\nDAU052\nDAW44\nDAQ12345678\nDAX44\nDAYBRO\nDAZBLK\nDDK1\nDDL0\nDDC11111115\nDDB11111116\nDDAM\nDDGN\nDDFT\nDDEN\nDDD0\nDDH11111117\nDDI11111118\nDDJ11111119\n\r")
    }
    
    func testVersionEightParser() {
        testVersionParser(mockLicense: MockLicenseFactory.versionEightLicense, licenseDataString: "@\n\u{1e}\rANSI 123456080201DL00000511DLDCN11\nDCO12\nDCLW\nDCM22\nDCJauditInformation\nDCK123456\nDCIplaceOfBirth\nDCF12345678912345678912\nDCGUSA\nDCD8\nDCE2\nDCB9\nDCA10\nDCU5TH\nDCRJRD\nDCSlastName\nDCPJVD\nDCQJED\nDBNlastNameAlias\nDBA11111112\nDBC1\nDBB11111114\nDBD11111113\nDBGgivenNameAlias\nDBSsuffixAlias\nDADmiddleName, middleName\nDAGstreetAddress\nDACfirstName\nDAHstreetAddressTwo\nDAIcity\nDAJstate\nDAK12345\nDAU052\nDAW44\nDAQ12345678\nDAX44\nDAYBRO\nDAZBLK\nDDK1\nDDL0\nDDC11111115\nDDB11111116\nDDAM\nDDGN\nDDFT\nDDEN\nDDD0\nDDH11111117\nDDI11111118\nDDJ11111119\n\r")
    }
    
    func testVersionNineParser() {
        testVersionParser(mockLicense: MockLicenseFactory.versionNineLicense, licenseDataString: "@\n\u{1e}\rANSI 123456090201DL00000511DLDCN11\nDCO12\nDCLW\nDCM22\nDCJauditInformation\nDCK123456\nDCIplaceOfBirth\nDCF12345678912345678912\nDCGUSA\nDCD8\nDCE2\nDCB9\nDCA10\nDCU5TH\nDCRJRD\nDCSlastName\nDCPJVD\nDCQJED\nDBNlastNameAlias\nDBA11111112\nDBC1\nDBB11111114\nDBD11111113\nDBGgivenNameAlias\nDBSsuffixAlias\nDADmiddleName, middleName\nDAGstreetAddress\nDACfirstName\nDAHstreetAddressTwo\nDAIcity\nDAJstate\nDAK12345\nDAU052\nDAW44\nDAQ12345678\nDAX44\nDAYBRO\nDAZBLK\nDDK1\nDDL0\nDDC11111115\nDDB11111116\nDDAM\nDDGN\nDDFT\nDDEN\nDDD0\nDDH11111117\nDDI11111118\nDDJ11111119\n\r")
    }

    func testVersionTenParser() {
        testVersionParser(mockLicense: MockLicenseFactory.versionNineLicense, licenseDataString: "@\n\u{1e}\rANSI 123456090201DL00000511DLDCN11\nDCO12\nDCLW\nDCM22\nDCJauditInformation\nDCK123456\nDCIplaceOfBirth\nDCF12345678912345678912\nDCGUSA\nDCD8\nDCE2\nDCB9\nDCA10\nDCU5TH\nDCRJRD\nDCSlastName\nDCPJVD\nDCQJED\nDBNlastNameAlias\nDBA11111112\nDBC1\nDBB11111114\nDBD11111113\nDBGgivenNameAlias\nDBSsuffixAlias\nDADmiddleName, middleName\nDAGstreetAddress\nDACfirstName\nDAHstreetAddressTwo\nDAIcity\nDAJstate\nDAK12345\nDAU052\nDAW44\nDAQ12345678\nDAX44\nDAYBRO\nDAZBLK\nDDK1\nDDL0\nDDC11111115\nDDB11111116\nDDAM\nDDGN\nDDFT\nDDEN\nDDD0\nDDH11111117\nDDI11111118\nDDJ11111119\n\r")
    }
}
