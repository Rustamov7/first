//
//  QuotePresenter.swift
//  storyboard
//
//  Created by Vladimir on 17.07.2021.
//

import Foundation
import UIKit

class QuotesPresenter {
    
    enum Constants {
        static let resultsLimit = 100
    }
    
    var service: QuoteService? = QuoteService()
    var offset = Int.zero
    var quotes: [QuoteDoc] = []
    weak var viewController: QuoteViewController?
    var isLoading = false
    
    func loadNext() {
        if isLoading {
            return
        }
        isLoading = true
        service?.getQuote(parameters: PaginationParameteres(limit: Constants.resultsLimit, offset: offset)) { [self] response in
            if self.offset < response.total {
                self.offset += Constants.resultsLimit
                self.quotes.append(contentsOf: response.docs)
                self.viewController?.reloadData()
                self.isLoading = false
            }
        }
    }
}
