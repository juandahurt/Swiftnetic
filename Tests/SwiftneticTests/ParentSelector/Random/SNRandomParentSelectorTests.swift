//
//  SNRandomParentSelectorTests.swift
//  
//
//  Created by Juan Hurtado on 6/01/23.
//

@testable import Swiftnetic
import XCTest

final class SNRandomParentSelectorTests: XCTestCase {
    var population: [SNIndividual] = []
    let numberOfParentsToSelect = 3
    
    override func setUp() {
        let initializer = SNPopluationInitializer(min: 0, max: 1, numberOfGenes: 3, size: 4)
        population = initializer.initPopulation()
    }
    
    func test_selectedParentsSize_shouldBeEqualToTheOneExpected() {
        let selector = SNRandomParentSelector()
        let parents = selector.selectParents(from: population, numberOfParentsToSelect: numberOfParentsToSelect)
        XCTAssertEqual(parents.count, numberOfParentsToSelect)
    }
}
