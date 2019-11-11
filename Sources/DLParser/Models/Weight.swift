//
//  Weight.swift
//  DLParser
//
//  Created by Andrew Johnson on 4/19/18.
//

import Foundation

/**
    Contains fields for describing the weight of the license holder.
 */
public struct Weight: Equatable {
    
    /// The weight range of the license holder, if any.
    public var range: WeightRange?
    
    /// The weight of the license holder in pounds, if any.
    public var pounds: Double?
    
    public init(range: WeightRange? = nil, pounds: Double? = nil) {
        self.range = range
        self.pounds = pounds
    }
}
