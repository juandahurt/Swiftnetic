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
    var toolbox: SNToolbox!
    let numberOfParentsToSelect = 2
    
    override func setUp() {
        let initializer = SNPopluationInitializer(min: 0, max: 1, numberOfGenes: 3, size: 4)
        population = initializer.initPopulation()
        do {
            toolbox = try .init(
                generations: 2,
                populationSize: 4,
                numberOfGenes: 3,
                numberOfParentsToSelect: numberOfParentsToSelect
            )
        } catch {
            assertionFailure("toolbox couldn't be initiated")
        }
    }
    
    func test() {
        let selector = SNRandomParentSelector()
        let parents = selector.selectParents(from: population, toolbox: toolbox)
        XCTAssertEqual(parents.count, numberOfParentsToSelect)
    }
}
