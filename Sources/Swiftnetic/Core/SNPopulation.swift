//
//  File.swift
//  
//
//  Created by Juan Hurtado on 26/02/22.
//

import Foundation

public class SNPopulation<G: SNGenome> {
    private let logger = SNLogger()
    
    var organisms: [SNOrganism<G>] = []
    
    public func evolve(verbose: Bool = false) {
        if verbose {
            logger.log("evolving population...")
        }
        print(organisms)
    }
}
