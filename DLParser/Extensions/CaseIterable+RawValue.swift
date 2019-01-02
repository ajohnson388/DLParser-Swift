//
//  CaseIterable+RawValue.swift
//  DLParser
//
//  Created by Andrew Johnson on 12/30/18.
//  Copyright © 2018 Andrew Johnson. All rights reserved.
//

import Foundation

extension CaseIterable where Self: RawRepresentable, Self.RawValue: Equatable {
    
    static func of(_ rawValue: RawValue) -> Self? {
        return allCases.first { $0.rawValue == rawValue }
    }
}
