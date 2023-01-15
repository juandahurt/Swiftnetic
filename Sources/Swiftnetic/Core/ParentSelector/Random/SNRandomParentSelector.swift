//
//  SNRandomParentSelector.swift
//  
//
//  Created by Juan Hurtado on 5/01/23.
//

import Foundation

/// Class that implements a random parent selection.
class SNRandomParentSelector: SNParentSelector {
    func selectParents(from population: [SNIndividual], toolbox: SNToolbox) -> [SNIndividual] {
        var populationCopy = population
        var parents: [SNIndividual] = []
        var parentsCounter = 0
        while parentsCounter < toolbox.numberOfParentsToSelect {
            let randomIndex = Int.random(in: 0..<(toolbox.populationSize - parentsCounter))
            parents.append(populationCopy[randomIndex])
            populationCopy.remove(at: randomIndex)
            parentsCounter += 1
        }
        return parents
    }
}