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
    let minGeneValue = -4.0 // TODO: allow the user to set this value.
    /// The maximum value that a gene can have.
    let maxGeneValue = 4.0 // TODO: allow the user to set this value.
    /// The type of genotype
    let genotypeType: SNGenotypeType
    /// It describes what the goal of the algortihm is.
    ///
    /// So if you want to, for example, maximize the `fitness` value, you would use `.maximize`. When we say that
    /// the algorithm will maximize the fitness value, the best individuals wille be the ones the greather value and viceversa.
    let goal: SNAlgorithmGoal
    /// Indicates if the stats of every generation will be calculated and logged on console.
    ///
    /// It's default value is `false`
    let verbose: Bool
    /// The function that will desribe how good an individual is.
    let fitnessFunction: ([Double]) -> Double
    
    public init(
        generations: Int,
        populationSize: Int,
        numberOfGenes: Int,
        numberOfParentsToSelect: Int,
        genotypeType: SNGenotypeType,
        goal: SNAlgorithmGoal = .maximize,
        verbose: Bool = false,
        fitnessFunction: @escaping ([Double]) -> Double
    ) {
        assert(generations > 0, "the number of generations must be greather than zero")
        assert(populationSize > 0, "the population size must be greather than zero")
        assert(numberOfGenes > 0, "the number of genes must be greather than zero")
        self.generations = generations
        self.populationSize = populationSize
        self.numberOfGenes = numberOfGenes
        self.numberOfParentsToSelect = numberOfParentsToSelect
        self.genotypeType = genotypeType
        self.goal = goal
        self.verbose = verbose
        self.fitnessFunction = fitnessFunction
    }
}
