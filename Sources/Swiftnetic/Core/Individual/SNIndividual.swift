//
//  SNIndividual.swift
//  
//
//  Created by Juan Hurtado on 7/01/23.
//

import Foundation

/// struct that represents every individual (solution) in the population.
struct SNIndividual {
    /// The actual representation of the solution.
    var genotype: [Double]
    /// It describes how good this solution is.
    var fitness: Double
}
