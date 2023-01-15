//
//  SNSinglePointCrossoverExcecutorTests.swift
//  
//
//  Created by Juan Hurtado on 8/01/23.
//

@testable import Swiftnetic
import XCTest

final class SNSinglePointCrossoverExcecutorTests: XCTestCase {
    func test() {
        let parents: [SNIndividual] = [
            .init(genotype: [1,1,1,1], fitness: 0),
            .init(genotype: [0,0,0,0], fitness: 0),
        ]
        let excecutor = SNSinglePointCrossoverExcecutor()
        let offspring = excecutor.crossover(parents: parents)
        XCTAssertTrue(offspring.count == 2)
        XCTAssertEqual(offspring[0].genotype, [0,0,1,1])
        XCTAssertEqual(offspring[1].genotype, [1,1,0,0])
    }
}
