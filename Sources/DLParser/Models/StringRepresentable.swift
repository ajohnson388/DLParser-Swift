//
//  StringRepresentable.swift
//  DLParser
//
//  Created by Andrew Johnson on 12/30/18.
//  Copyright © 2018 Andrew Johnson. All rights reserved.
//

import Foundation

/**
    Defines a type the can be instantiated by a unique string value.
 */
protocol StringRepresentable: CaseIterable {
    
    /**
        - parameters:
            - rawValue: The string value to instantiate the concrete type with.
        - returns: The concrete type identified by the rawValue, if any.
     */
    static func of(_ rawValue: String) -> Self?
}
