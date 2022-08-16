//
//  TVShowModel.swift
//  S.Kh_Task_23
//
//  Created by Saba Khitaridze on 16.08.22.
//

import Foundation

struct TVShowModel: Codable {
    let firstReleaseDate: String?
    let id: Int?
    let name: String?
    let originCountry: [String]?
    let originalLanguage, originalName, overview: String?
    let popularity: Double?
    let posterPath: String
    let voteAverage: Double?

    enum CodingKeys: String, CodingKey {
        case firstReleaseDate = "first_air_date"
        case id, name
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview, popularity
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
    }
}
