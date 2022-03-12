import XCTest
@testable import Swiftnetic

final class SwiftneticTests: XCTestCase {
    func testExample() throws {
        var toolbox = SNToolbox<Int>(populationSize: 3, numOfItems: 2)
        toolbox.geneGenerator = {
            Int.random(in: 0...1)
        }
        toolbox.fitnessFunction = { individual in
            Double.random(in: 0...10)
        }
        let algorithm = SNAlgorithm(toolbox: toolbox)
        algorithm.run()
    }
}
