//
//  SNInitializer.swift
//  
//
//  Created by Juan Hurtado on 26/02/22.
//

import Foundation

/// Swiftnetic algorithm initializer
public protocol SNInitializer: AnyObject {
    /// Initializes the population. Generally you intitialize the population randomly.
    /// - Returns: The initial population
    func initPopulation<Genotype>() -> Genotype
}
