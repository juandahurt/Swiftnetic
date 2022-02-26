//
//  SNAlgorithm.swift
//  
//
//  Created by Juan Hurtado on 26/02/22.
//

import Foundation

public final class SNSimpleAlgorithm<Genotype> {
    /// Logger helper
    private let logger = SNLogger()
    
    /// The current Population
    private var currentPopulation: Genotype?
    
    /// Population initializer
    public weak var initializer: SNInitializer?
    
    /// Starts the excecution of the algorithm
    /// - Parameter verbose: Indicates if the algorithm will show its current state during excecution
    public func start(verbose: Bool = false) throws -> Genotype {
        guard let initializer = initializer else {
            throw SNErrors.intializerNotProvided
        }

        if verbose {
            logger.log("generating initial population")
        }
        currentPopulation = initializer.initPopulation()
        
        return currentPopulation!
    }
}
