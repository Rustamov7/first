//
//  Network.swift
//  storyboard
//
//  Created by Vladimir on 03.06.2021.
//

import Foundation
import Alamofire

class Network {
    let URL = "https://the-one-api.dev/v2/book"
   
    func getData(completion: @escaping (ListOfBooks) -> Void)
    {
        let request = AF.request(URL, method: .get)
        
        request.response
        {   response in
            if let data = response.data
            {
                do {
                    let model = try JSONDecoder().decode(ListOfBooks.self, from: data)
                    completion(model)
                }
                catch {
                    print(error)
                    
                }
            }
        }
    }
}
