//
//  TvShowCredits.swift
//  Filim
//
//  Created by Akif on 12.08.2022.
//

import Foundation

struct TvShowCredits: Codable{
    let id: Int
    let cast: [TvShowCast]
    let crew: [TvShowCrew]
}

struct TvShowCast: Codable{
    let adult: Bool
    let gender: Int?
    let id: Int
    let known_for_department: String
    let name: String
    let original_name: String
    let popularity: Double
    let profile_path: String?
    let character: String
    let credit_id: String
    let order: Int
}



struct TvShowCrew: Codable{
    let adult: Bool
    let gender: Int?
    let id: Int
    let known_for_department: String
    let name: String
    let original_name: String
    let popularity: Double
    let profile_path: String?
    let credit_id: String
    let department: String
    let job: String
}
