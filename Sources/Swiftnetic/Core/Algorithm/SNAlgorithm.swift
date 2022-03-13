//
//  SNAlgorithm.swift
//  
//
//  Created by Juan Hurtado on 12/03/22.
//

import Foundation

/// The genetic algorithm itself.
///
/// If  you want to play with it using, for example, bits, just instantiate the algorithm and pass a toolbox into the constructor like this:
///
/// ```
/// var toolbox = SNToolbox<Int>(populationSize: 3, numOfItems: 2)
/// toolbox.geneGenerator = {
///    Int.random(in: 0...1)
/// }
/// let algorithm = SNAlgorithm(toolbox: toolbox)
/// // And then, you can run the algorithm
/// algorithm.run()
/// ```
final class SNAlgorithm<G> {
    /// Algorithm's population
    private var population: [SNIndividual<G>] = []
    
    /// Algorithm's toolbox
    private let toolbox: SNToolbox<G>
    
    init(toolbox: SNToolbox<G>) {
        self.toolbox = toolbox
    }
    
    /// Initializises the population
    /// - Parameter size: Number of individuals
    /// - Parameter geneGenerator: toolbox gene generator
    /// - Parameter numOfItems: number of genes inside every individual
    private func initPopulation(ofSize size: Int, using geneGenerator: () -> G, numOfItems: Int) {
        population = (0..<size).map { _ in
            SNIndividual(generator: geneGenerator, numOfItems: numOfItems)
        }
    }
    
    /// Updates the fitness value of every individual in the population using the fitness function
    private func evaluatePopulation() {
        for indIndex in population.indices {
            population[indIndex].evaluate(with: toolbox.fitnessFunction)
        }
    }
    
    /// Excecutes the algorithm
    func run(numGenerations: Int) {
        let logger = SNLogger()
        guard let geneGenerator = toolbox.geneGenerator else {
            logger.log("oops! It seems that you have not provided a gene generator inside the given toolbox.")
            return
        }
        
        initPopulation(ofSize: toolbox.populationSize, using: geneGenerator, numOfItems: toolbox.numOfItems)
        evaluatePopulation()
        
        var generation = 0
        while generation < numGenerations {
            toolbox.selectionMethod.select(from: population)
            generation += 1
        }
    }
}
