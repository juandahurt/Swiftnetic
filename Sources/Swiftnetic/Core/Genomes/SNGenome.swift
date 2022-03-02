//
//  SNGenome.swift
//  
//
//  Created by Juan Hurtado on 26/02/22.
//

import Foundation


public protocol SNGenome: SNInitilizable {
}


/// It allows to initialize a genome
public protocol SNInitilizable {
    /// Usually, you would use this to intialize randomly the genome.
    mutating func initialize(ofSize size: Int)
}
