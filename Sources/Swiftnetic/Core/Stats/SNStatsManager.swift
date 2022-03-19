//
//  SNStatsManager.swift
//  
//
//  Created by Juan Hurtado on 16/03/22.
//

import Foundation


/// Swiftnetic stats manager
struct SNStatsManager {
    private(set) var maxFitness: Double = 0.0
    private(set) var minFitness: Double = 0.0
    
    mutating func update<G>(using population: [SNIndividual<G>]) {
        let population = population.sorted(by: { $0.fitness > $1.fitness })
        maxFitness = population[0].fitness
        minFitness = population.last!.fitness
    }
}
