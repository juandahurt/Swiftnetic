//
//  SNToolbox.swift
//  
//
//  Created by Juan Hurtado on 11/03/22.
//

import Foundation


/// It contains all the tools needed to excecute the genetic algorithm
struct SNToolbox<G> {
    /// Number of individuals
    var populationSize: Int
    
    /// Nimbers of genes inside every individual
    var numOfItems: Int
    
    /// It will be called to generate every single gene
    var geneGenerator: (() -> G)?
    
    /// It defines how good an individual is. If not set, it will return 0.
    var fitnessFunction: (SNIndividual<G>) -> Double = { _ in 0 }
    
    /// Parent selection  method.
    var selectionMethod: SNSelectionMethod
    
    /// The method to generate new children
    var reproductionMethod: SNReproductionMethod = SNOnePointCrossover()
    
    /// Indicates how often a individual is mutated
    var mutationRate: Double = 0.0
    
    /// Method that will be used to mutate the population
    var mutationMethod: SNMutationMethod = .flipBit
}
