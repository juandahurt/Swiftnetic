//
//  File.swift
//  
//
//  Created by Juan Hurtado on 26/02/22.
//

import Foundation

/// Represent a living population
public class SNPopulation<G: SNGenome> {    
    /// All the organisms of the population
    public private(set) var organisms: [SNOrganism<G>]
    
    init(organisms: [SNOrganism<G>]) {
        self.organisms = organisms
    }
}


extension SNPopulation: CustomStringConvertible {
    public var description: String {
        organisms.description
    }
}
