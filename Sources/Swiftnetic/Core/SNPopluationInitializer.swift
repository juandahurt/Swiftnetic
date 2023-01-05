//
//  SNPopluationInitializer.swift
//  
//
//  Created by Juan Hurtado on 2/01/23.
//

import Foundation

class SNPopluationInitializer {
    let min: Double
    let max: Double
    let numberOfGenes: Int
    let size: Int
    
    init(min: Double, max: Double, numberOfGenes: Int, size: Int) {
        self.min = min
        self.max = max
        self.numberOfGenes = numberOfGenes
        self.size = size
    }
    
    func initPopulation() -> [Individual] {
        (0..<size).map { _ in
            .init(
                genotype: (0..<numberOfGenes).map { _ in
                    Double.random(in: min...max)
                },
                fitness: 0
            )
        }
    }
}
