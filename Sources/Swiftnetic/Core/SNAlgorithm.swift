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
    /// The algorithm toolbox. See `SNToolbox` to get more details.
    let toolbox: SNToolbox
    var population: [SNIndividual] = []
    private let parentSelector: SNParentSelector
    private let crossoverExcecutor: SNCrossoverExcecutor
    
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
        var currentGeneration = 0
        // step 1: init the population
        initPopulation()
        // while the number of generation has not been reached...
        while currentGeneration < toolbox.generations {
            // step 2: select the parents
            let parents = parentSelector.selectParents(from: population, numberOfParentsToSelect: toolbox.numberOfParentsToSelect)
            // step 3: crossover
            let offspring = crossoverExcecutor.crossover(parents: parents)
            // TODO: step 4: mutation
            currentGeneration += 1
        }
    }
    
    func initPopulation() {
        let initializer = SNPopluationInitializer(
            min: toolbox.minGeneValue,
            max: toolbox.maxGeneValue,
            numberOfGenes: toolbox.numberOfGenes,
            size: toolbox.populationSize)
        population = initializer.initPopulation()
    }
}
