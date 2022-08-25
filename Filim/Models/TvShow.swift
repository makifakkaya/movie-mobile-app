//
//  TvShow.swift
//  Filim
//
//  Created by Akif on 11.08.2022.
//

import Foundation

struct MyTvShows: Codable{
    let page: Int
    let results: [TvShow]
    let total_results: Int
    let total_pages: Int
}

struct TvShow: Codable{
    let poster_path: String?
    let popularity: Double
    let id: Int
    let backdrop_path: String?
    let vote_average: Double
    let overview: String
    let first_air_date: String
    let origin_country: [String]
    let genre_ids: [Int]
    let original_language: String
    let vote_count: Int
    let name: String
    let original_name: String
}


