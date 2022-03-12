//
//  SNAlgorithm.swift
//  
//
//  Created by Juan Hurtado on 12/03/22.
//

import Foundation

/// The genetic algorithm itself
final class SNAlgorithm {
    
    /// Excecutes the algorithm
    /// - Parameter toolbox: A SNToolbox instance
    static func run<G>(using toolbox: SNToolbox<G>) {
        let logger = SNLogger()
        guard let _ = toolbox.geneGenerator else {
            logger.log("oops! It seems that you have not provided a gene gerator inside the given toolbox.")
            return
        }
    }
}
