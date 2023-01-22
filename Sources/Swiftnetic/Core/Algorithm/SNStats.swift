//
//  SNStats.swift
//  
//
//  Created by Juan Hurtado on 22/01/23.
//

import Foundation

/// Class that contains the stats of a certain generation.
///
/// It's also in charge of showing the stats to the user.
class SNStats {
    var max = 0.0
    var min = 0.0
    var avg = 0.0
    
    func update(usingIndividual individual: SNIndividual) {
        if individual.fitness > max {
            max = individual.fitness
        }
        if individual.fitness < min {
            min = individual.fitness
        }
    }
    
    func reset() {
        max = 0.0
        min = 0.0
        avg = 0.0
    }
    
    func show(generation: Int) {
        if generation == 1 {
            print(String(format: "\t%@ \t%@ \t%@ \t%@", "GEN", "MAX", "MIN", "AVG"))
        }
        print(String(format: "%6d %6.2f %6.2f %6.2f", generation, max, min, avg))
    }
}
