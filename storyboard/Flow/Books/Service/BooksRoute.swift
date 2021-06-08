//
//  BooksRoute.swift
//  storyboard
//
//  Created by Vladimir on 06.06.2021.
//

import Foundation

enum BooksRoute {
    case books
    case chapter(id: String)
}

extension BooksRoute: Route {
    
    var url: String {
        switch self {
        case .books:
            return "/book"
        case let .chapter(id):
            return "/book/\(id)/chapter"
        }
    }
}
