import XCTest
@testable import Swiftnetic

final class SwiftneticTests: XCTestCase {
    func testExample() throws {
        var toolbox = SNToolbox<Int>(
            populationSize: 5,
            numOfItems: 2,
            selectionMethod: SNRoulette(n: 2)
        )
        toolbox.geneGenerator = {
            Int.random(in: 0...1)
        }
        toolbox.fitnessFunction = { individual in
            Double.random(in: 0...10)
        }
        let algorithm = SNAlgorithm(toolbox: toolbox)
        algorithm.run(numGenerations: 2)
    }
}
