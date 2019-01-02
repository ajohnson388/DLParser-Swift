//
//  Lookupable.swift
//  DLParser
//
//  Created by Andrew Johnson on 12/30/18.
//  Copyright © 2018 Andrew Johnson. All rights reserved.
//

import Foundation

protocol StringRepresntable: CaseIterable {
    static func of(_ rawValue: String) -> Self?
}

extension StringRepresntable where Self: RawRepresentable {
    
    static func of(_ rawValue: String) -> Self? {
        return Self.of(rawValue)
    }
}
