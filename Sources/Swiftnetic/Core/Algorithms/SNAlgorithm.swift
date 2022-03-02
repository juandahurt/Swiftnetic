//
//  SNAlgorithm.swift
//  
//
//  Created by Juan Hurtado on 1/03/22.
//

import Foundation


/// Defines a genetic algorithm
public protocol SNAlgorithm: AnyObject {
    associatedtype G where G: SNGenome
    
    /// Algorithm's population
    var population: SNPopulation<G> { get set }
    
    /// Number of genes of every organism
    var sizeOfOrganisms: Int { get }
    
    /// Fitness evaluator
    var evaluator: SNEvaluator? { get set }
    
    // TODO: Add selection method
    
    /// Usually, you would use this method to initialize you population randomly.
    func initPopulation()
    
    /// Excecutes the algorithm.
    /// - Returns: The evolved population.
    func start(verbose: Bool) throws -> SNPopulation<G>
    
    // TODO: Add method to select best individuals
}
