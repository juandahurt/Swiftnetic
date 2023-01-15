//
//  SNParentSelectorFactory.swift
//  
//
//  Created by Juan Hurtado on 5/01/23.
//

import Foundation

/// Factory class that creates a parent selector.
class SNParentSelectorFactory {
    /// The number of parents to be selected.
    let numParentsToSelect: Int
    
    init(numParentsToSelect: Int) {
        self.numParentsToSelect = numParentsToSelect
    }
    
    /// Returns an instance that implements the `SNParentSelector` protocol.
    /// - Parameter type: The type of parent selection.
    /// - Returns: The requried parent selector instance.
    func createParentSelector(basedOn type: SNParentSelectionType) -> SNParentSelector {
        switch type {
        case .random:
            return SNRandomParentSelector()
        }
    }
}
