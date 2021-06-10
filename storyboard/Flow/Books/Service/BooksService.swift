//
//  BooksService.swift
//  storyboard
//
//  Created by Vladimir on 06.06.2021.
//

import Foundation

class BookService {
    
    let httpClient: HTTPClientProtocol
    
    init(httpClient: HTTPClientProtocol = HTTPClient()) {
        self.httpClient = httpClient
    }
    
    func getBooks(completion: @escaping (ListOfBooks) -> Void) {
        httpClient.request(for: BooksRoute.books, completion: completion)
    }
    
    func getChapters(bookID: String, completion: @escaping (ChapterList) -> Void) {
        httpClient.request(for: BooksRoute.chapter(id: bookID), completion: completion)
    }
}
