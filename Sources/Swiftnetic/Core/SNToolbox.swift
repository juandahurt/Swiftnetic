//
//  SNToolbox.swift
//  
//
//  Created by Juan Hurtado on 31/12/22.
//

import Foundation

/// This is the genetic algorithm toolbox. It contains the configuration needed to run the algorithm.
///
/// Use this toolbox to custimize the genetic algorithm to suit your needs.
///
/// ```swift
/// let myToolbox = SNToolbox(
///     generations: 10,
///     populationSize: 5,
///     numberOfGenes: 4
/// )
/// ```
/// > Warning: `generations`, `populationSize` and `numberOfGenes` properties must be `> 0` (for obvoius reasons).
///
public struct SNToolbox {
    /// The number of generations.
    let generations: Int
    /// The amount of individuals for every generation.
    let populationSize: Int
    /// The number of genes for every individual.
    let numberOfGenes: Int
    /// Crossover method to be used within the algortihm.
    let crossoverType: SNCrossoverMethod = .singlePoint
    /// The way the algorithm will select the parents of a new generation.
    let parentSelectionType: SNParentSelectionType = .random
    /// The number of parents to select.
    let numberOfParentsToSelect: Int
    /// The minimum value that a gene can have.
    let minGeneValue = -4.0
    /// The maximum value that a gene can have.
    let maxGeneValue = 4.0
    
    public init(
        generations: Int,
        populationSize: Int,
        numberOfGenes: Int,
        numberOfParentsToSelect: Int
    ) throws {
        guard generations > 0 else {
            throw SNToolboxError.wrongNumberOfGenerations
        }
        guard populationSize > 0 else {
            throw SNToolboxError.wrongPopulationSize
        }
        guard numberOfGenes > 0 else {
            throw SNToolboxError.wrongNumberOfGenes
        }
        
        self.generations = generations
        self.populationSize = populationSize
        self.numberOfGenes = numberOfGenes
        self.numberOfParentsToSelect = numberOfParentsToSelect
    }
}

public enum SNToolboxError: Error {
    case wrongNumberOfGenerations
    case wrongPopulationSize
    case wrongNumberOfGenes
}

enum SNParentSelectionType {
    case random
}
