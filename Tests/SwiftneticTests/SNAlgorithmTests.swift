//
//  SNAlgorithmTests.swift
//  
//
//  Created by Juan Hurtado on 2/01/23.
//

import Swiftnetic
import XCTest

final class SNAlgorithmTests: XCTestCase {
    func test() {
        let toolbox = SNToolbox(generations: 100, populationSize: 20, numberOfGenes: 7, numberOfParentsToSelect: 2, genotypeType: .bit, goal: .maximize) { [weak self] genotype in
            guard let self else { return 0.0 }
            let x = self.fromBinaryToNumber(binary: genotype)
            return self.evaluate(x: x)
        }
        let algorithm = SNAlgorithm(toolbox: toolbox)
        algorithm.run()
    }
    
    func fromBinaryToNumber(binary: [Double]) -> Double {
        var binaryStr = ""
        for number in binary {
            binaryStr += "\(Int(number))"
        }
        let integer = Int(binaryStr, radix: 2) ?? 0
        return Double(integer)
    }
    
    func evaluate(x: Double) -> Double {
        -3 * pow(x, 2) + 6 * x + 4
    }
}
