//
//  SNReproductionMethod.swift
//  
//
//  Created by Juan Hurtado on 14/03/22.
//

import Foundation


/// Describes a method to generate children.
protocol SNReproductionMethod {
    /// Generates new children using the genetic information from the parents.
    /// - Parameter parents: Children's parents
    /// - Returns: The children generated
    func generateChildren<G>(beetwen parents: (mom: SNIndividual<G>, dad: SNIndividual<G>)) -> (son: SNIndividual<G>, daughter: SNIndividual<G>)
}
