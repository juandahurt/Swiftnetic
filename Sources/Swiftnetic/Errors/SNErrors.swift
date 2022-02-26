//
//  SNErrors.swift
//  
//
//  Created by Juan Hurtado on 26/02/22.
//

import Foundation

enum SNErrors: Error {
    case intializerNotProvided
}

extension SNErrors: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .intializerNotProvided:
            return "You have not provided an initializer!"
        }
    }
}
