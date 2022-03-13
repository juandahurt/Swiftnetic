import XCTest
@testable import Swiftnetic

final class SwiftneticTests: XCTestCase {
    func test_roulette_selection() {
        let numOfParents = 5
        let sut = SNRoulette(n: numOfParents)
        var population: [SNIndividual<Int>] = []
        for i in 0..<50 {
            let individual = SNIndividual(
                generator: {
                    Int.random(in: 0...1)
                },
                numOfItems: 3,
                fitness: Double(i)
            )
            population.append(individual)
        }
        let parents = sut.select(from: population)
        XCTAssertEqual(parents.count, numOfParents)
    }
}
