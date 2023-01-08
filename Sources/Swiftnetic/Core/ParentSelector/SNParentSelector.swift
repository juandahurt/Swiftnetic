//
//  SNParentSelector.swift
//  
//
//  Created by Juan Hurtado on 5/01/23.
//

import Foundation

/// Protocol that describes the parent selector behaviour.
protocol SNParentSelector {
    /// Selects the parents for the crossover
    /// - Parameters:
    ///   - population: The current population.
    ///   - toolbox: The algorithm toolbox.
    /// - Returns: The selected parents as a list of individuals.
    func selectParents(from population: [SNIndividual], toolbox: SNToolbox) -> [SNIndividual]
}
