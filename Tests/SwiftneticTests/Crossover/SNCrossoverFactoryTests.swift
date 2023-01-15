//
//  SNCrossoverFactoryTests.swift
//  
//
//  Created by Juan Hurtado on 8/01/23.
//

@testable import Swiftnetic
import XCTest

final class SNCrossoverFactoryTests: XCTestCase {
    func test_factory_shouldReturnSinglePointExcecutor() {
        let method = SNCrossoverMethod.singlePoint
        let parents: [SNIndividual] = [.init(genotype: [0,1], fitness: 0)]
        let factory = SNCrossoverFactory(parents: parents)
        let excecutor = factory.createExcecutor(basedOn: method)
        XCTAssertTrue(excecutor is SNSinglePointCrossoverExcecutor)
    }
}
