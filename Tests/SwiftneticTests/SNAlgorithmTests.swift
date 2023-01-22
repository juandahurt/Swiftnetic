//
//  SNAlgorithmTests.swift
//  
//
//  Created by Juan Hurtado on 2/01/23.
//

import Swiftnetic
import XCTest

final class SNAlgorithmTests: XCTestCase {
    let numberOfGenes = 7
    let generations = 100
    
    func test_algorithmResult_shouldHaveExpectedDimensions() {
        let toolbox = SNToolbox(generations: generations, populationSize: 20, numberOfGenes: numberOfGenes, numberOfParentsToSelect: 2, genotypeType: .bit, goal: .maximize) { [weak self] genotype in
            guard let self else { return 0.0 }
            let x = self.fromBinaryToNumber(binary: genotype)
            return self.evaluate(x: x)
        }
        let algorithm = SNAlgorithm(toolbox: toolbox)
        let res = algorithm.run()
        
        XCTAssertEqual(res.best.count, numberOfGenes)
        XCTAssertGreaterThan(res.gen, 0)
        XCTAssertLessThanOrEqual(res.gen, generations)
    }
}

// MARK: Helpers
extension SNAlgorithmTests {
    func fromBinaryToNumber(binary: [Double]) -> Double {
        var binaryStr = ""
        for number in binary {
            binaryStr += "\(Int(number))"
        }
        let integer = Int(binaryStr, radix: 2) ?? 0
        return Double(integer)
    }
    
    func evaluate(x: Double) -> Double {
        // f(x) = -3x^2 + 6x + 4
        -3 * pow(x, 2) + 6 * x + 4
    }
}
