import XCTest
@testable import Swiftnetic

final class SwiftneticTests: XCTestCase {
    func test_initialization() {
        let genotype = SNBitnome()
        let sut = SNBasicAlgorithm(genotype: genotype, numberOfOrganisms: 3, sizeOfOrganisms: 9)
        sut.initPopulation()
        
        XCTAssert(sut.population.organisms.count == 3)
        XCTAssert(sut.population.organisms.allSatisfy { $0.genotype.bits.count == 9 })
    }
    
    func test_evaluator_not_provided() {
        let genotype = SNBitnome()
        let sut = SNBasicAlgorithm(genotype: genotype, numberOfOrganisms: 3, sizeOfOrganisms: 9)
        
        do {
            let _ = try sut.start()
        } catch SNError.evaluatorNotProvided {
            
        } catch {
            XCTFail("Wrong error thrown!")
        }
    }
}
