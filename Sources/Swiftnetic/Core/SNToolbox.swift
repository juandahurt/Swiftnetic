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
}
