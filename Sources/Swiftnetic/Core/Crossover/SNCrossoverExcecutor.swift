//
//  SNCrossoverExcecutor.swift
//  
//
//  Created by Juan Hurtado on 7/01/23.
//

import Foundation

/// Protocol that describes the behaviour of a crossover method excecutor.
protocol SNCrossoverExcecutor {
    /// Performs a crossover between the selected parents.
    /// - Parameter parents: The selected parents.
    /// - Returns: The generated offspring.
    func crossover(parents: [SNIndividual]) -> [SNIndividual]
}
