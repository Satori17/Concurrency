//
//  TVShowData.swift
//  S.Kh_Task_23
//
//  Created by Saba Khitaridze on 16.08.22.
//

import Foundation

struct TVShowData: Codable {
    let page: Int
    let results: [TVShowModel]
    let totalPages: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
    }
}
