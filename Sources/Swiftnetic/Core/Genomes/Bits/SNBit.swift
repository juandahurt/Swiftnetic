//
//  SNBit.swift
//  
//
//  Created by Juan Hurtado on 1/03/22.
//

import Foundation


/// Represents a single bit
struct SNBit: SNGene {
    var value: Int
    
    init(_ value: Int) {
        assert(value == 0 || value == 1)
        self.value = value
    }
}


extension SNBit: CustomStringConvertible {
    var description: String {
        "\(value)"
    }
}
