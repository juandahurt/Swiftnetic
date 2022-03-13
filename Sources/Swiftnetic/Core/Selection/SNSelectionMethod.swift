//
//  SNSelectionMethod.swift
//  
//
//  Created by Juan Hurtado on 12/03/22.
//

import Foundation


/// Parent selection methods
protocol SNSelectionMethod {
    /// Selects a number of individuals from a certain population
    /// - Parameter population: The population
    /// - Returns: The selected individuals
    func select<G>(from population: [SNIndividual<G>]) -> [SNIndividual<G>]
}
