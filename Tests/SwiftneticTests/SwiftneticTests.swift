import XCTest
@testable import Swiftnetic

final class SwiftneticTests: XCTestCase {
    func testExample() throws {
        let toolbox = SNToolbox<Int>(populationSize: 5)
        SNAlgorithm.run(using: toolbox)
    }
}
