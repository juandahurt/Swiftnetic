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
    /// - Parameters:
    ///     - toolbox: A Swiftnetic toolbox instance
    static func run<G>(using toolbox: SNToolbox<G>) {
        guard let _ = toolbox.geneGenerator else {
            return
        }
    }
}
