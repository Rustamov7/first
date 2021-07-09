//
//  AutorizationService.swift
//  storyboard
//
//  Created by Vladimir on 10.06.2021.
//
import UIKit
import Foundation

enum AutorizationError: Error {
    case wrongCredential
}

class AutorizationService {
    func authorize(login: String, password: String, completion: @escaping (Result<String, AutorizationError>) -> Void) {
        sleep(2)
        DispatchQueue.main.async {
            if (login == "vova") && (password == "123") {
                completion(.success("fVd9Cs4EiPOBtRCy32kW"))
            } else {
                completion(.failure(.wrongCredential))
            }
        }
    }
}
