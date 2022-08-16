//
//  Fetcher.swift
//  S.Kh_Task_23
//
//  Created by Saba Khitaridze on 16.08.22.
//

import UIKit

enum FetchingError: String, Error {
    
    case requestError = "Could not fetch data with request"
    case responseError = "Wrong Response"
    case statusCodeError = "Unsucessful response status code"
    case dataError = "Could not get data when decoding"
    case urlComponentError = "There's an error in url components"
}


class Fetcher {
    
    static let shared = Fetcher()
    let session = URLSession(configuration: .default)
    
    
    func fetchData<T: Codable, O: DataUrl>(withBuilder urlBuilder: O, as model: T.Type, onCompletion: @escaping (Result<T, FetchingError>) -> Void) {
        
        guard let request = urlBuilder.urlRequest else {
            onCompletion(.failure(.urlComponentError))
            return
        }
        
        let task = session.dataTask(with: request) { data, response, error in
            if let _ = error {
                onCompletion(.failure(FetchingError.requestError))
            }
            
            guard let response = response as? HTTPURLResponse else {
                onCompletion(.failure(FetchingError.responseError))
                return
            }
            
            guard (200...299).contains(response.statusCode) else {
                return
            }
            
            if let data = data {
                //Parsing JSON
                let decoder = JSONDecoder()
                do {
                    let fetchedData = try decoder.decode(model, from: data)
                    DispatchQueue.main.async {
                        onCompletion(.success(fetchedData))
                    }
                } catch {
                    onCompletion(.failure(FetchingError.dataError))
                    print(error.localizedDescription)
                    
                }
            }
        }
        //API call
        task.resume()
    }

}
