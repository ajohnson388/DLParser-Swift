//
//  String+Convenience.swift
//  LicenseParser
//
//  Created by Andrew Johnson on 3/24/18.
//

import Foundation

extension String {
    
    var trimmedEdges: String {
        let characterSet = CharacterSet.whitespacesAndNewlines
        return trimmingCharacters(in: characterSet)
    }
    
    var splitByComma: [String] {
        return split(separator: ",").map(String.init)
    }
    
    var trimmedSplitByComma: [String] {
        return splitByComma.map { $0.trimmedEdges }
    }
    
    var double: Double? {
        return Double(self)
    }
}
