//
//  Gender.swift
//  DLParser
//
//  Created by Andrew Johnson on 3/12/18.
//

import Foundation

/**
     AAMVA standard accepted genders.
 */
public enum Gender: String, StringRepresentable {
    
    /// Unknown gender
    case unknown = "0"
    
    /// Male gender
    case male = "1"
    
    /// Female gender
    case female = "2"
    
    /// Gener not specified
    case notSpecified = "9"
}
