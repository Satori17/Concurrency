//
//  Request.swift
//  S.Kh_Task_23
//
//  Created by Saba Khitaridze on 16.08.22.
//

import Foundation

class Request {
    
    func url(urlComponent: inout URLComponents) -> URLRequest? {
        urlComponent.queryItems?.append(URLQueryItem(name: "api_key", value: apikey))
        
        urlComponent.queryItems = [URLQueryItem(name: "api_key", value: apikey),
        URLQueryItem(name: "language", value: "en-US")
        ]
        
        guard let url = urlComponent.url else { return nil }
        let request = URLRequest(url: url)
        
        return request
    }
    
}
