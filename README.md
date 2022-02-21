![DLParser](https://github.com/ajohnson388/DLParser-Swift/blob/master/images/DLParser-Logo.png)

> DLParser is a library for parsing barcode data from AAMVA compliant driver licenses.

[![Swift Version][swift-image]][swift-url]
[![License][license-image]][license-url]
[![Platform][platform-image]][platform-url]

DLParser aims to decode barcode data from AAMVA compliant driver licenses. The parser
supports all AAMVA versions and AAMVA defined fields.

## Features

- [x] Support for all AAMVA standards (v1-10)
- [x] Support for all AAMVA fields
- [x] License model for all AAMVA fields
- [x] Offline use
- [x] Unit tests for version parsers

## Requirements

- iOS 12.0+
- Swift 5.1
- Xcode 13.2.1
- Cocoapods

## Cocoapod Installation

```ruby
pod 'DLParser', '~> 3.1.0'
```

## Carthage Installation

```ruby
github "ajohnson388/DLParser-Swift"
```

## SPM Installation

```swift
dependencies: [
    .package(url: "https://github.com/ajohnson388/DLParser-Swift.git", from: "3.1.0")
]
```

## Sample Installation

Clone the repo.

Navigate to your project directory and run `pod install`.

Open the `.xcworkspace` file.

Create an App id using your developer account.

Run the unit tests for the version parsers and assert they pass.

Run the example app on a physical device.

Scan driver license barcodes by using the example app and view output through the console.

## Contribute

Open an issue or make a pull request.

## Note

This library was derived from [https://github.com/ksoftllc/license-parser](https://github.com/ksoftllc/license-parser).

## Meta
Andrew Johnson – ajohnson388@gmail.com

Distributed under the MIT license. See ``LICENSE`` for more information.

[https://github.com/ajohnson388/](https://github.com/ajohnson388/)

[swift-image]:https://img.shields.io/badge/swift-5.1-orange.svg
[swift-url]: https://swift.org/
[test-coverage-image]:https://img.shields.io/badge/Coverage-80%25-orange.svg
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE
[platform-image]:https://img.shields.io/badge/platform-iOS-green.svg?style=flat
[platform-url]:https://developer.apple.com/
