//
//  Truncation.swift
//  DLParser
//
//  Created by Andrew Johnson on 3/12/18.
//

import Foundation

/**
     AAMVA standard accepted truncation types.
 */
public enum Truncation: String, StringRepresentable {
    
    /// Indicates a name is truncated
    case truncated = "T"
    
    /// Indicates a name is not truncated
    case none = "N"
}
