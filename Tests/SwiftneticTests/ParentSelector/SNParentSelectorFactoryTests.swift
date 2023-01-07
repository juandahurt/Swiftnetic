//
//  SNParentSelectorFactoryTests.swift
//  
//
//  Created by Juan Hurtado on 6/01/23.
//

@testable import Swiftnetic
import XCTest

final class SNParentSelectorFactoryTests: XCTestCase {
    func test_factory_shouldReturnRandomSelector() {
        let factory = SNParentSelectorFactory(numParentsToSelect: 2)
        let selector = factory.createParentSelector(basedOn: .random)
        XCTAssertTrue(selector is SNRandomParentSelector)
    }
}
