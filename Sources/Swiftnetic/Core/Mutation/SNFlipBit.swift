//
//  SNFlipBit.swift
//  
//
//  Created by Juan Hurtado on 15/03/22.
//

import Foundation


/// Fip bit mutation method.
///
/// Flips n bits (depending on the given rate) from 0 to 1 or viceversa.
final class SNFlipBit: SNMutationMethod {
    override func mutate<G>(individual: inout SNIndividual<G>, by rate: Double) {
        guard G.self == Int.self else {
            fatalError("You can't use the flip bit mutation method if you're not using a bit based population")
        }
        
        individual.genes = individual.genes.map {
            let alpha = Double.random(in: 0...1)
            if alpha <= rate {
                return (($0 as! Int) == 1 ? 0 : 1) as! G
            } else {
                return $0
            }
        }
    }
}
