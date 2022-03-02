//
//  SNBitnome.swift
//  
//
//  Created by Juan Hurtado on 1/03/22.
//

import Foundation


/// Represents a set of bits.
struct SNBitnome: SNGenome {
    /// Bits of the genome
    var bits: [SNBit]
    
    init() {
        bits = []
    }
    
    mutating func initialize(ofSize size: Int) {
        bits = (0..<size).map { _ in SNBit(Int.random(in: 0...1)) }
    }
}


extension SNBitnome: CustomStringConvertible {
    var description: String {
        var str = ""
        bits.forEach { str.append("\($0)") }
        return str
    }
}
