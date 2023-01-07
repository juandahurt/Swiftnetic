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
    var population: [Individual] = []
    var parentSelector: SNParentSelector
    
    public init(toolbox: SNToolbox) {
        self.toolbox = toolbox
        self.parentSelector = SNParentSelectorFactory(
            numParentsToSelect: toolbox.numberOfParentsToSelect
        ).createParentSelector(basedOn: toolbox.parentSelectionType)
    }
    
    /// It excecutes the algorithm.
    public func run() {
        // step 1: init the population
        initPopulation()
        // while the number of generation has not been reached...
        // step 2: select the parents
        let _ = parentSelector.selectParents(from: population, toolbox: toolbox)
        // TODO: step 3: crossover
        // TODO: step 4: mutation
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

struct Individual {
    var genotype: [Double]
    var fitness: Double
}
