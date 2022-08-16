//
//  BaseUrl.swift
//  S.Kh_Task_23
//
//  Created by Saba Khitaridze on 16.08.22.
//

import Foundation

let apikey = "0ff508ee2a76af47d3d9f18e0ad27d9e"

protocol DataUrl {
    var urlString: String { get }
    var urlRequest: URLRequest? { get }
    var components: URLComponents? { get set }
    func withBaseUrl()
}


enum BaseUrl: String {
    case tvShowUrl = "https://api.themoviedb.org/3/tv/top_rated?"
    case similarShowUrl = "https://api.themoviedb.org/3/tv/"
}
