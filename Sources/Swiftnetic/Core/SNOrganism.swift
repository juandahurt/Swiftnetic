//
//  SNOrganism.swift
//  
//
//  Created by Juan Hurtado on 26/02/22.
//

import Foundation

/// Represents a living organism
class SNOrganism<G: SNGenome> {
    var genotype: G
    
    init(genotype: G) {
        self.genotype = genotype
    }
}

extension SNOrganism: CustomStringConvertible {
    var description: String {
        "\(genotype)"
    }
}
