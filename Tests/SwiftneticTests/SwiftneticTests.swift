import XCTest
@testable import Swiftnetic

final class SwiftneticTests: XCTestCase {
    func test_not_provided_intitializer() throws {
        let sut = SNSimpleAlgorithm<String>()
        do {
            let _ = try sut.start(verbose: true)
        } catch {
            print(error.localizedDescription)
        }
    }
}
