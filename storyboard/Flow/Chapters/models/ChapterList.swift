//
//  ChaptersList.swift
//  storyboard
//
//  Created by Vladimir on 08.06.2021.
//
import Foundation
// MARK: - ChapterList
struct ChapterList: Codable {
    let docs: [ChapterDoc]
    let total, limit, offset, page: Int
    let pages: Int
}
// MARK: - Doc
struct ChapterDoc: Codable {
    let id, chapterName: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case chapterName
    }
}
