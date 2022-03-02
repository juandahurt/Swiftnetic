//
//  SNEvaluator.swift
//  
//
//  Created by Juan Hurtado on 2/03/22.
//

import Foundation


/// Describes a fitness evaluator
public protocol SNEvaluator: AnyObject {
    /// Evaluates how good an organism is, thus, it is problem dependent. This funtion is also knwon as fitness function.
    /// - Returns: The fitness value
    func evaluate<G: SNGenome>(organism: SNOrganism<G>) -> Double
}
