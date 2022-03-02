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
    var sizeOfOrganisms: Int
    
    init(genotype: G, numberOfOrganisms: Int, sizeOfOrganisms: Int) {
        population = SNPopulation(organisms: (0..<numberOfOrganisms).map { _ in
            SNOrganism(genotype: genotype)
        })
        self.sizeOfOrganisms = sizeOfOrganisms
    }
    
    func initPopulation() {
        population.organisms.forEach { $0.genotype.initialize(ofSize: sizeOfOrganisms) }
    }
    
    public func start(verbose: Bool = true) -> SNPopulation<G> {
        logger.log("initializing population...")
        initPopulation()
        
        // TODO: Select best individuals
        // TODO: Evaluate the population
        // TODO: Reproduce
        // TODO: Mutate the population
        
        return population
    }
}
