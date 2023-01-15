//
//  SNCrossoverFactory.swift
//  
//
//  Created by Juan Hurtado on 7/01/23.
//

import Foundation

/// Factory class that creates a crossover excecutor.
class SNCrossoverFactory {
    let parents: [SNIndividual]
    
    init(parents: [SNIndividual]) {
        self.parents = parents
    }
    
    /// Returns an instance that implements the protocol `SNCrossoverExcecutor`.
    /// - Parameter method: The crossover method.
    /// - Returns: The required crossover excecutor instance.
    func createExcecutor(basedOn method: SNCrossoverMethod) -> SNCrossoverExcecutor {
        switch method {
        case .singlePoint:
            return SNSinglePointCrossoverExcecutor()
        }
    }
}
