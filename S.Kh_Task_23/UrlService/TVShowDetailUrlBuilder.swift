//
//  TVShowDetailUrlBuilder.swift
//  S.Kh_Task_23
//
//  Created by Saba Khitaridze on 16.08.22.
//

import UIKit

class TVShowDetailUrlBuilder: Request, DataUrl {
    
    static let shared = TVShowDetailUrlBuilder()
    
    private(set) var urlString: String
    private(set) var urlRequest: URLRequest?
    var components: URLComponents?
    static var tvShowDetailId: Int?
    
    func withBaseUrl() {
        self.urlString = BaseUrl.similarShowUrl.rawValue
    }
    
    private func withTVShowId(id: Int) {
        self.urlString += "\(id)"
    }
    
    override init() {
        self.urlString = ""
        super.init()
        withBaseUrl()
        withTVShowId(id: TVShowDetailUrlBuilder.tvShowDetailId ?? 0)
        components = URLComponents(string: urlString)
        if var components = components {
            self.urlRequest = url(urlComponent: &components)
        }
    }
    
}
