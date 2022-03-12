//
//  SNToolbox.swift
//  
//
//  Created by Juan Hurtado on 11/03/22.
//

import Foundation


/// It contains all the tools needed to excecute the genetic algorithm
struct SNToolbox<G> {
    /// It will be called to generate avery single gene
    var geneGenerator: (() -> G)?
}
