# 🧬 Swiftnetic

An implementation of the genetic algorithm made entirely in Swift.

## How to use it?
### Setting up
The first thing you need is a toolbox to config the algorithm's behaviour.
```swift
// let's supose you want a population of 20 inviduals with 4 genes each one, 
// binary representation and 100 generations...
let yourToolbox = SNToolbox(
                generations: 100, 
                populationSize: 20, 
                numberOfGenes: 4, 
                numberOfParentsToSelect: 2, 
                genotypeType: .bit,
                fitnessFunction: fitnessFunc)
```
*Note: there is a boolean parameter called `verbose` that when is set to `true`, the algorithm will log some stats (per generation) to the console such as: max, min and average fitness values.*

### Fitness Function
If you see at the the toolbox `init`, there is a parameter `fitnessFunction` which is a function that receives a list of `Double` (that represents a certain individual) and must return a `Double`. This function will tell the algorithm how good and individual is based on the value that this function returns. Swiftnetic supports maximization and minimization of this value, to indicate which one of the two you want, just set the `goal` parameter in the toolbox.
```swift
func fitnessFunc(individual: [Double]) -> Double {
  // implement your own logic...
  return 0.0 // return the appropiate fitness value for this solution.
}
```

### Run
```swift
// after you have set up the toolbox, you can init the algorithm and excecute it
let algo = SNAlgorithm(toolbox: yourToolbox)
let res = algo.run()
```
Once you have excecuted the algorithm, it will return a `tuple` that contains two values. The first one, that is called `best` contains the best individual (based on its fitness value and the goal of the algorithm), the second one `gen` indicates the generation at wich the best individual was found.


## Implementation list
### Parent selection
| Name | Implemented |
| --- | --- |
| Random |✅|
| Tournament |❌|
| Roulette |❌|
| Rank |❌|

### Crossover
| Name | Implemented |
| --- | --- |
| Single point |✅|
| Two points |❌|
| Uniform |❌|

### Mutation
| Name | Implemented |
| --- | --- |
| Random |❌|
| Inversion |❌|
| Scramble |❌|
