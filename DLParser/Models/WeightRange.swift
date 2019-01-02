//
//  WeightRange.swift
//  DLParser
//
//  Created by Andrew Johnson on 3/26/18.
//

import Foundation

/**
    Parses weight range for v1-9 (All current versions).
 */
public struct WeightRange: Equatable {
    
    /// The weight range classifier defined in the license PDF417 data
    public var rank: Int
    
    /// The weight range for the given rank in kilograms.
    public var kilograms: CountableClosedRange<Int> {
        switch rank {
        case 1: return 32...45
        case 2: return 46...59
        case 3: return 60...70
        case 4: return 71...86
        case 5: return 87...100
        case 6: return 101...113
        case 7: return 114...127
        case 8: return 128...145
        case 9: return 146...Int.max
        default: return 0...31
        }
    }
    
    /// The weight range for the given rank in pounds.
    public var pounds: CountableClosedRange<Int> {
        switch rank {
        case 1: return 71...100
        case 2: return 101...130
        case 3: return 131...160
        case 4: return 161...190
        case 5: return 191...220
        case 6: return 221...250
        case 7: return 251...280
        case 8: return 281...320
        case 9: return 321...Int.max
        default: return 0...70
        }
    }
    
    public init(rank: Int) {
        self.rank = rank
    }
}
