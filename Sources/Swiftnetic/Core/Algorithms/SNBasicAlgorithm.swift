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
    weak var evaluator: SNEvaluator?
    
    init(genotype: G, numberOfOrganisms: Int, sizeOfOrganisms: Int) {
        population = SNPopulation(organisms: (0..<numberOfOrganisms).map { _ in
            SNOrganism(genotype: genotype)
        })
        self.sizeOfOrganisms = sizeOfOrganisms
    }
    
    func initPopulation() {
        population.organisms.forEach { $0.genotype.initialize(ofSize: sizeOfOrganisms) }
    }
    
    public func start(verbose: Bool = true) throws -> SNPopulation<G> {
        guard let evaluator = evaluator else {
            throw SNError.evaluatorNotProvided
        }
        
        logger.log("initializing population...")
        initPopulation()
        
        population.organisms.forEach {
            $0.fitness = evaluator.evaluate(organism: $0)
        }
        
        // TODO: Select best individuals
        // TODO: Reproduce
        // TODO: Mutate the population
        
        return population
    }
}
