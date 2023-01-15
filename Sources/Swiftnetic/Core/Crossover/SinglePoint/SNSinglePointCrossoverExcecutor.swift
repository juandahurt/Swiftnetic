//
//  SNSinglePointCrossoverExcecutor.swift
//  
//
//  Created by Juan Hurtado on 7/01/23.
//

import Foundation

/// Class that implements the single point crossover.
class SNSinglePointCrossoverExcecutor: SNCrossoverExcecutor {
    func crossover(parents: [SNIndividual]) -> [SNIndividual] {
        assert(
            parents.endIndex.isMultiple(of: 2),
            "to implemented a single point crossover, the number of parents must be even!"
        )
        var offspring: [SNIndividual] = []
        // arrange parents as a set of pairs
        var pairs: [[SNIndividual]] = []
        var parentsCopy = parents
        while !parentsCopy.isEmpty {
            var pair: [SNIndividual] = []
            for _ in 0...1 {
                if let parent = parentsCopy.popLast() {
                    pair.append(parent)
                }
            }
            pairs.append(pair)
        }
        
        // excecute crossover beetwen the every pair of individuals
        for pair in pairs {
            assert(pair.endIndex == 2, "one of the generated pairs is not actually a pair.")
            let father = pair[0]
            let mother = pair[1]
            assert(father.genotype.endIndex == mother.genotype.endIndex, "the parents have different dimensions")
            let midIndex = father.genotype.endIndex / 2
            let fatherHead = father.genotype.prefix(midIndex)
            let fatherTail = father.genotype.suffix(from: midIndex)
            let motherHead = mother.genotype.prefix(midIndex)
            let motherTail = mother.genotype.suffix(from: midIndex)
            let sonGenotype = fatherHead + motherTail
            let daughterGenotype = motherHead + fatherTail
            let son = SNIndividual(genotype: Array<Double>(sonGenotype), fitness: 0)
            let daughter = SNIndividual(genotype: Array<Double>(daughterGenotype), fitness: 0)
            offspring.append(son)
            offspring.append(daughter)
        }
        return offspring
    }
}
