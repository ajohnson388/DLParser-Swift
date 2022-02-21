# Changelog for DLParser-Swift

Changes are welcomed by everyone. Please review the contributing section in the [README](README.md).

## 3.1.0 - February 20, 2022

### Codebase improvements
* Fixed Xcode warnings
* Updated project settings
* Integrated Github Actions
* Set minimum iOS target to 12.0
* Updated unit tests

### Features
* Added support for version 10 parser (2020)
* Added support for 3 missing AAMVA fields: `under 18 until date`, `under 19 until date`, `under 21 until date`

### Bug fixes
* Fixed a crash when parsing height from the version 1 standard.

## 3.0.0 - November 11, 2019
* Fixed some Xcode warnings
* Added Carthage support
* Added SPM support
* Upgraded to Swift 5.1

## 2.0.0 - January 2, 2019

### Codebase improvements
* Cleaned up and added more documentation
* Removed public access from internal properties in the parser
* Added unit tests for all 9 version parsers
* Updated to Swift 4.2

### Bug fixes
* Fixed a bug causing the middle names not to parse correctly for v1 licenses
* Fixed weight parsing to accept both weight range and exact weight, if ever needed
* Fixed a bug in the string parsing regex expression that caused some values containing 'ddl' to falsely be treated as data elements
* Fixed several typos
* Fixed missing data element "DAV" for height in centimeters

### New categories

* Added `Race` category for the race field that complies with the ANSI D-20 standard
* Added `Compliance` category for the compliance type field that complies with the ANSI D-20 standard
* Extended the `Gender` category to be fully compliant with the ANSI D-20 standard

## 1.0.0 - September 10, 2018
* Fixed public fields in the driver license model
* Support for Cocoapods

## 0.1 - April 22, 2018
* Initial commit
