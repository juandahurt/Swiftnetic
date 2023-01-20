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
    private var population: [SNIndividual] = []
    private let parentSelector: SNParentSelector
    private let crossoverExcecutor: SNCrossoverExcecutor
    
    private var maxValue = 0.0
    private var minValue = 0.0
    private var average = 0.0
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
    public func run() {
        // step 1: init the population
        initPopulation()
        // while the number of generation has not been reached...
        while currentGeneration < toolbox.generations {
            resetStats()
            // evaluate the fitness of "every" individual
            for individualIndex in population.indices {
                let fitness = toolbox.fitnessFunction(population[individualIndex].genotype)
                population[individualIndex].fitness = fitness
                if fitness > maxValue {
                    maxValue = fitness
                }
                if fitness < minValue {
                    minValue = fitness
                }
                average += fitness
            }
            average = average / Double(population.endIndex)
            population = population.sorted(by: { $0.fitness > $1.fitness })
            // step 2: select the parents
            let parents = parentSelector.selectParents(from: population, numberOfParentsToSelect: toolbox.numberOfParentsToSelect)
            // step 3: crossover
            let offspring = crossoverExcecutor.crossover(parents: parents)
            // TODO: step 4: mutation
            // step 5: update population
            population.removeSubrange(population.endIndex - offspring.endIndex..<population.endIndex)
            population.append(contentsOf: offspring)
            currentGeneration += 1
            showStats()
        }
    }
    
    func initPopulation() {
        let initializer = SNPopluationInitializer(
            min: toolbox.minGeneValue,
            max: toolbox.maxGeneValue,
            numberOfGenes: toolbox.numberOfGenes,
            size: toolbox.populationSize,
            type: toolbox.genotypeType)
        population = initializer.initPopulation()
    }
    
    func showStats() {
        if currentGeneration == 1 {
            print(String(format: "\t%@ \t%@ \t%@ \t%@", "GEN", "MAX", "MIN", "AVG"))
        }
        print(String(format: "%6d %6.2f %6.2f %6.2f", currentGeneration, maxValue, minValue, average))
    }
    
    func resetStats() {
        minValue = population[0].fitness
        maxValue = population[0].fitness
        average = 0.0
    }
}
