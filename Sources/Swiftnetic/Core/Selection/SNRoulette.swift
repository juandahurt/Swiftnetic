//
//  SNRoulette.swift
//  
//
//  Created by Juan Hurtado on 12/03/22.
//

import Foundation


/// Roulete wheel selection method.
///
/// The probability of choosing an individual for breeding of the next generation is proportional to its fitness, the better the fitness is, the higher chance for that individual to be chosen.
///
/// *Note that in this method one individual can be drawn multiple times*
final class SNRoulette: SNSelectionMethod {
    /// Number of individuals to be selected
    private let n: Int
    
    init(n: Int) {
        self.n = n
    }
    
    func select<G>(from population: [SNIndividual<G>]) -> [SNIndividual<G>] {
        let sum = population.reduce(0.0, { sum, individual in sum + individual.fitness })
        var wheel: [Double] = [0]
        let sortedPopulation = population.sorted(by: { $0.fitness < $1.fitness })
        
        var accFitness = 0.0
        for individual in sortedPopulation {
            accFitness += individual.fitness / sum
            wheel.append(accFitness)
        }
        
        var chosen: [SNIndividual<G>] = []
        var count = 0
        while count < n {
            let alpha = Double.random(in: 0...1)
            for index in wheel.indices {
                if index == wheel.indices.last {
                    chosen.append(sortedPopulation[index - 1])
                    break
                }
                if wheel[index] <= alpha && alpha <= wheel[index + 1] {
                    chosen.append(sortedPopulation[index - 1])
                    break
                }
            }
            count += 1
        }
        
        return chosen
    }
}
