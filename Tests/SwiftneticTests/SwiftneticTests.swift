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
        let parents = sut.select(from: &population)
        XCTAssertEqual(parents.count, numOfParents)
    }
    
    func test_one_point_crossover() {
        let sut = SNOnePointCrossover()
        let mom = SNIndividual(genes: [0,0,0,1,1,1])
        let dad = SNIndividual(genes: [1,1,1,0,0,0])
        
        let (son, daughter) = sut.generateChildren(beetwen: (mom, dad))

        XCTAssertEqual(son.genes, [0,0,0,0,0,0])
        XCTAssertEqual(daughter.genes, [1,1,1,1,1,1])
    }
    
    func test_flip_bit_mutation() {
        let sut = SNFlipBit()
        
        var ind = SNIndividual(genes: [0,0,0,0,0,0])
        sut.mutate(individual: &ind, by: 0.75)
        print(ind)
        XCTAssertNotEqual(ind.genes, [0,0,0,0,0,0])
    }
}
