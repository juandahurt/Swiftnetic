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
    
    /// How good this individual is
    private(set) var fitness: Double
    
    init(generator: () -> G, numOfItems: Int) {
        genes = (0..<numOfItems).map { _ in generator() }
        fitness = 0
    }
    
    /// Updates its fitness value.
    /// - Parameter fitnessFunction: The fitness function
    mutating func evaluate(with fitnessFunction: (SNIndividual<G>) -> Double) {
        fitness = fitnessFunction(self)
    }
}


extension SNIndividual: CustomStringConvertible {
    var description: String {
        "\(genes)"
    }
}
