//
//  SNBasicAlgorithm.swift
//  
//
//  Created by Juan Hurtado on 1/03/22.
//

import Foundation


/// Basic genetic algorithm.
final class SNBasicAlgorithm<G: SNGenome>: SNAlgorithm {
    /// Logging helper
    private let logger = SNLogger()
    
    var population: SNPopulation<G>
    
    init() {
        population = SNPopulation(organisms: [])
    }
    
    func initPopulation() {
        // TODO: Check how to initialize the population
    }
    
    func start(verbose: Bool = true) -> SNPopulation<G> {
        logger.log("initializing population")
        initPopulation()
        
        // TODO: Select best individuals
        // TODO: Evaluate the population
        // TODO: Reproduce
        // TODO: Mutate the population
        
        return population
    }
}
