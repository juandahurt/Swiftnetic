//
//  SNOnePointCrossover.swift
//  
//
//  Created by Juan Hurtado on 15/03/22.
//

import Foundation


/// One-point crossover
final class SNOnePointCrossover: SNReproductionMethod {
    func generateChildren<G>(beetwen parents: (mom: SNIndividual<G>, dad: SNIndividual<G>)) -> (son: SNIndividual<G>, daughter: SNIndividual<G>) {
        let cxIndex = parents.mom.genes.count / 2
        
        var momHead = parents.mom.genes.prefix(cxIndex)
        let momTail = parents.mom.genes.suffix(cxIndex)
        var dadHead = parents.dad.genes.prefix(cxIndex)
        let dadTail = parents.dad.genes.suffix(cxIndex)
        
        var son = parents.mom
        momHead.append(contentsOf: dadTail)
        son.genes = Array(momHead)
        var daugther = parents.dad
        dadHead.append(contentsOf: momTail)
        daugther.genes = Array(dadHead)
        
        return (son, daugther)
    }
}
