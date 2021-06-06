//
//  ListOfBooks.swift
//  storyboard
//
//  Created by Vladimir on 03.06.2021.
//

import Foundation

// MARK: - ListOfBooks
struct ListOfBooks: Decodable {
    let docs: [Doc]
    let total, limit, offset, page: Int
    let pages: Int
}
// MARK: - Doc
struct Doc: Decodable {
    let id, name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
    }
}
