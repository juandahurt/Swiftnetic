//
//  SNAlgorithm.swift
//  
//
//  Created by Juan Hurtado on 2/01/23.
//

import Foundation

/// This is the genetic algortihm.
///
/// ```swift
/// // after intializing the toolbox...
/// let algorithm = SNAlgorithm(toolbox: yourToolbox)
/// algortihm.run() // To excecute the algorithm
/// ```
public class SNAlgorithm {
    private let toolbox: SNToolbox
    private let parentSelector: SNParentSelector
    private let crossoverExcecutor: SNCrossoverExcecutor
    private let stats = SNStats()
    
    private var population: [SNIndividual] = []
    private var currentGeneration = 0
    
    public init(toolbox: SNToolbox) {
        self.toolbox = toolbox
        self.parentSelector = SNParentSelectorFactory(
            numParentsToSelect: toolbox.numberOfParentsToSelect
        ).createParentSelector(basedOn: toolbox.parentSelectionType)
        self.crossoverExcecutor = SNCrossoverFactory()
            .createExcecutor(basedOn: toolbox.crossoverType)
    }
    
    /// It excecutes the algorithm.
    /// - Returns: A tuple that contains the best individual and the number generation at which the best fitness value was reached.
    public func run() -> (best: [Double], gen: Int) {
        // step 1: init the population
        initPopulation()
        // while the number of generation has not been reached...
        while currentGeneration < toolbox.generations {
            if toolbox.verbose { stats.reset() }
            // evaluate the fitness of "every" individual
            for individualIndex in population.indices {
                let fitness = toolbox.fitnessFunction(population[individualIndex].genotype)
                population[individualIndex].fitness = fitness
                if toolbox.verbose {
                    stats.update(usingIndividual: population[individualIndex])
                    stats.avg += fitness
                }
            }
            stats.avg /= Double(population.endIndex)
            population = population.sorted(by: {
                if toolbox.goal == .maximize {
                    return $0.fitness > $1.fitness
                } else {
                    return $0.fitness < $1.fitness
                }
            })
            // step 2: select the parents
            let parents = parentSelector.selectParents(from: population, numberOfParentsToSelect: toolbox.numberOfParentsToSelect)
            // step 3: crossover
            let offspring = crossoverExcecutor.crossover(parents: parents)
            // TODO: step 4: mutation
            // step 5: update population
            population.removeSubrange(population.endIndex - offspring.endIndex..<population.endIndex)
            population.append(contentsOf: offspring)
            currentGeneration += 1
            if toolbox.verbose { stats.show(generation: currentGeneration) }
        }
        return (population.first!.genotype, currentGeneration)
    }
    
    /// ```
    /// func run() -> (best: Inidividual, gen: Int)
    /// ```
    
    private func initPopulation() {
        let initializer = SNPopluationInitializer(
            min: toolbox.minGeneValue,
            max: toolbox.maxGeneValue,
            numberOfGenes: toolbox.numberOfGenes,
            size: toolbox.populationSize,
            type: toolbox.genotypeType)
        population = initializer.initPopulation()
    }
}
