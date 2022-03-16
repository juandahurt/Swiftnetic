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
/// var toolbox = SNToolbox(populationSize: 3, numOfItems: 2)
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
        // 1. Initialization
        initPopulation(ofSize: toolbox.populationSize, using: geneGenerator, numOfItems: toolbox.numOfItems)
        
        var generation = 1
        while generation <= numGenerations {
            // 2. Evaluation
            evaluatePopulation()
            
            // 3. Selection
            let parents = toolbox.selectionMethod.select(from: &population)
            let matings = (0..<parents.count/2).map { index -> (SNIndividual<G>, SNIndividual<G>) in
                return (parents[index*2], parents[index*2+1])
            }
            for (mom, dad) in matings {
                // 4. Reproduction
                var (son, daugther) = toolbox.reproductionMethod.generateChildren(beetwen: (mom, dad))
                
                // 5. Mutation
                toolbox.mutationMethod.mutate(individual: &son, by: toolbox.mutationRate)
                toolbox.mutationMethod.mutate(individual: &daugther, by: toolbox.mutationRate)
                
                // 6. Update population
                population.append(son)
                population.append(daugther)
            }
            generation += 1
        }
    }
}
