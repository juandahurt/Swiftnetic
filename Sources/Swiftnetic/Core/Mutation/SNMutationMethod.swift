//
//  SNMutationMethod.swift
//  
//
//  Created by Juan Hurtado on 15/03/22.
//

import Foundation


/// Describes a mutation method
class SNMutationMethod {
    func mutate<G>(individual: inout SNIndividual<G>, by rate: Double) {
        fatalError("This method has been implemented!")
    }
}


extension SNMutationMethod {
    static let flipBit = SNFlipBit()
}
