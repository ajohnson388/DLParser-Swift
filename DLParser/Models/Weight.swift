//
//  Weight.swift
//  LicenseParser
//
//  Created by Andrew Johnson on 4/19/18.
//

import Foundation

public struct Weight: Equatable {
    
    public var range: WeightRange?
    public var pounds: Double?
    
    public init(range: WeightRange? = nil, pounds: Double? = nil) {
        self.range = range
        self.pounds = pounds
    }
}
