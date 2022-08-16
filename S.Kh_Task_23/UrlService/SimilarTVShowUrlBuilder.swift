//
//  SimilarTVShowUrlBuilder.swift
//  S.Kh_Task_23
//
//  Created by Saba Khitaridze on 16.08.22.
//

import Foundation


class SimilarTVShowUrlBuilder: Request, DataUrl {
    
    static let shared = SimilarTVShowUrlBuilder()
    
    private(set) var urlString: String
    private(set) var urlRequest: URLRequest?
    var components: URLComponents?
    static var tvShowId: Int?
    
    func withBaseUrl() {
        self.urlString = BaseUrl.similarShowUrl.rawValue
    }
    
    private func withTVShowId(id: Int) {
        self.urlString += "\(id)/"
    }
    
    private func withPath() {
        self.urlString += "similar?"
    }
    
    override init() {
        self.urlString = ""
        super.init()
        withBaseUrl()
        withTVShowId(id: SimilarTVShowUrlBuilder.tvShowId ?? 0)
        withPath()
        components = URLComponents(string: urlString)
        if var components = components {
            self.urlRequest = url(urlComponent: &components)
        }
        
    }
    
}
