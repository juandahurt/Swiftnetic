//
//  SNIndividual.swift
//  
//
//  Created by Juan Hurtado on 12/03/22.
//

import Foundation


/// Represents an individual
struct SNIndividual<G> {
    /// Individual's genes
    var genes: [G]
    
    init(generator: () -> G, numOfItems: Int) {
        genes = (0..<numOfItems).map { _ in generator() }
    }
}


extension SNIndividual: CustomStringConvertible {
    var description: String {
        "\(genes)"
    }
}
