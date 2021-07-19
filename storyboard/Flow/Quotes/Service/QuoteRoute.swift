//
//  QuoteRoute.swift
//  storyboard
//
//  Created by Vladimir on 17.07.2021.
//
import Foundation

enum QuoteRoute {
    case quotes(parameters: PaginationParameteres)
}

extension QuoteRoute: Route {
    
    var url: String {
        switch self {
        case .quotes:
            return "/quote"
        }
    }
    
    var parameters: [String : Any] {
        switch self {
        case let .quotes(parameters):
            return parameters.toDict() ?? [:]
        }
    }
}
