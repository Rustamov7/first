//
//  QuoteService.swift
//  storyboard
//
//  Created by Vladimir on 17.07.2021.
//

import Foundation

class QuoteService {
    
    let httpClient: HTTPClientProtocol
    
    init(httpClient: HTTPClientProtocol = HTTPClient()) {
        self.httpClient = httpClient
    }
    
    func getQuote(parameters: PaginationParameteres, completion: @escaping (QuotesList) -> Void) {
        httpClient.request(for: QuoteRoute.quotes(parameters: parameters), completion: completion)
    }
}
