//
//  SNOrganism.swift
//  
//
//  Created by Juan Hurtado on 26/02/22.
//

import Foundation

/// Represents a living organism
public class SNOrganism<G: SNGenome> {
    /// Organism's genotype
    public var genotype: G
    
    /// Indicates how good this organism (solution) is
    public private(set) var fitness: Double
    
    init(genotype: G, fitness: Double = 0) {
        self.genotype = genotype
        self.fitness = fitness
    }
}

extension SNOrganism: CustomStringConvertible {
    public var description: String {
        "\(genotype)"
    }
}
