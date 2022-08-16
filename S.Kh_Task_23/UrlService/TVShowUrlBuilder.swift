//
//  TVShowUrlBuilder.swift
//  S.Kh_Task_23
//
//  Created by Saba Khitaridze on 16.08.22.
//

import UIKit


class TVShowUrlBuilder: Request, DataUrl {
    
    static let shared = TVShowUrlBuilder()
    
    private(set) var urlString: String
    private(set) var urlRequest: URLRequest?
    var components: URLComponents?
    
    func withBaseUrl() {
        self.urlString = BaseUrl.tvShowUrl.rawValue
    }
    
    override init() {
        self.urlString = ""
        super.init()
        withBaseUrl()
        components = URLComponents(string: urlString)
        if var components = components {
            self.urlRequest = url(urlComponent: &components)
        }
    }
    
}


