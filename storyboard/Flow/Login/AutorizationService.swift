//
//  AutorizationService.swift
//  storyboard
//
//  Created by Vladimir on 10.06.2021.
//

import Foundation

enum AutorizationError: Error {
    case wrongCredential
}

class AutorizationService {
    func authorize(login: String, password: String, completion: @escaping (Result<String, AutorizationError>) -> Void) {
        DispatchQueue.global().async {
            sleep(2)
            if login == "vova" || password == "123" {
                completion(.success("fVd9Cs4EiPOBtRCy32kW"))
            } else {
                completion(.failure(.wrongCredential))
            }
        }
    }
}
