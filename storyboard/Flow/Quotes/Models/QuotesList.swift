//
//  QuotesList.swift
//  storyboard
//
//  Created by Vladimir on 17.07.2021.
//

// MARK: - QuoteRsponse
 struct QuotesList: Codable {
     let docs: [QuoteDoc]
     let total, limit, offset: Int
     let page: Int?
     let pages: Int?
 }

 // MARK: - Doc
 struct QuoteDoc: Codable {
     let id, dialog: String
     let movie: String
     let character: String

     enum CodingKeys: String, CodingKey {
         case id = "_id"
         case dialog, movie, character
     }
 }
