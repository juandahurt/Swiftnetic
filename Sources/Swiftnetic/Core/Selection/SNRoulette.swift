//
//  SNRoulette.swift
//  
//
//  Created by Juan Hurtado on 12/03/22.
//

import Foundation


/// Roulete wheel selection method.
///
/// The probability of choosing an individual for breeding of the next generation is proportional to its fitness, the better the fitness is, the higher chance for that individual to be chosen.
///
/// *Note that in this method one individual can be drawn multiple times*
final class SNRoulette: SNSelectionMethod {
    /// Number of individuals to be selected
    private let n: Int
    
    init(n: Int) {
        self.n = n
    }
    
    func select<G>(from population: [SNIndividual<G>]) -> [SNIndividual<G>] {
        var chosen: [SNIndividual<G>] = []
        // TODO: Implement selection
        return chosen
    }
}
