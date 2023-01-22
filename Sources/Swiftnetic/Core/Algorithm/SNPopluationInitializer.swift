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
    let type: SNGenotypeType
    
    init(min: Double, max: Double, numberOfGenes: Int, size: Int, type: SNGenotypeType) {
        self.min = min
        self.max = max
        self.numberOfGenes = numberOfGenes
        self.size = size
        self.type = type
    }
    
    func initPopulation() -> [SNIndividual] {
        (0..<size).map { _ in
            .init(
                genotype: (0..<numberOfGenes).map { _ in
                    switch type {
                    case .double:
                        return Double.random(in: min...max)
                    case .bit:
                        let alpha = Double.random(in: 0...1)
                        return alpha > 0.5 ? 1 : 0
                    }
                },
                fitness: 0
            )
        }
    }
}
