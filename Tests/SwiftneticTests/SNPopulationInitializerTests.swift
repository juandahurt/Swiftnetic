//
//  SNPopulationInitializerTests.swift
//  
//
//  Created by Juan Hurtado on 2/01/23.
//

@testable import Swiftnetic
import XCTest

final class SNPopulationInitializerTests: XCTestCase {
    let genes = 3
    let min = 0.0
    let max = 1.0
    let size = 5
    
    var initializer: SNPopluationInitializer!
    var population: [SNIndividual]!
    
    override func setUp() {
        initializer = SNPopluationInitializer(min: min, max: max, numberOfGenes: genes, size: size, type: .double)
        population = initializer.initPopulation()
    }
    
    func test_population_shouldHaveRightSize() {
        XCTAssertEqual(population.count, size)
    }
    
    func test_individuals_shouldHaveRightNumberOfGenes() {
        for individual in population {
            XCTAssertEqual(individual.genotype.count, genes)
        }
    }
    
    func test_genes_shouldBeInsideTheGivenRange() {
        for individual in population {
            for gene in individual.genotype {
                XCTAssertLessThanOrEqual(gene, max)
                XCTAssertGreaterThanOrEqual(gene, min)
            }
        }
    }
}
