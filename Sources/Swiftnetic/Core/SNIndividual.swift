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
    
    /// Indicates how good this individual is
    var fitness: Double
    
    init(generator: () -> G, numOfItems: Int, fitness: Double = 0) {
        genes = (0..<numOfItems).map { _ in generator() }
        self.fitness = fitness
    }
    
    init(genes: [G]) {
        self.genes = genes
        self.fitness = 0
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
