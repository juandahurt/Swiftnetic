//
//  SNToolboxTests.swift
//  
//
//  Created by Juan Hurtado on 31/12/22.
//

import XCTest
import Swiftnetic

final class SNToolboxTests: XCTestCase {
    func testShouldThrowErrorWhenWrongNumberOfGenerationsIsProvided() {
        do {
            let _ = try SNToolbox(generations: 0, populationSize: 10, numberOfGenes: 1)
            XCTFail("Toolbox `init()` should throw when the number of generations is < 1")
        } catch {
            XCTAssertEqual(error as? SNToolboxError, SNToolboxError.wrongNumberOfGenerations)
        }
    }
    
    func testShouldThrowErrorWhenWrongPopulationSizeIsProvided() {
        do {
            let _ = try SNToolbox(generations: 10, populationSize: -1, numberOfGenes: 1)
            XCTFail("Toolbox `init()` should throw when population size is < 1")
        } catch {
            XCTAssertEqual(error as? SNToolboxError, SNToolboxError.wrongPopulationSize)
        }
    }
    
    func testShouldThrowErrorWhenWrongGenesNumberIsProvided() {
        do {
            let _ = try SNToolbox(generations: 10, populationSize: 10, numberOfGenes: 0)
            XCTFail("Toolbox `init()` should throw when the number of genes is < 1")
        } catch {
            XCTAssertEqual(error as? SNToolboxError, SNToolboxError.wrongNumberOfGenes)
        }
    }
}
