//
//  Rooter.swift
//  Filim
//
//  Created by Akif on 25.08.2022.
//

import Alamofire
import SweetRouter

enum Api: EndpointType {
    enum Environment: EnvironmentType {
        case production
        
        var value: URL.Env {
            switch self {
            case .production: return .init(.https, "api.themoviedb.org")
            }
        }
    }
    
    enum Route: RouteType {
        case popularMovies
        case nowPlayingMovies
        case topRatedMovies
        case popularTvShows
        case topRatedTvShows
        case movieDetails(for: Int)
        case tvShowDetails(for: Int)
        
        var route: URL.Route {
            switch self {
                
            case .popularMovies: return URL.Route(at: "3", "movie", "popular").query(("api_key", "05f4a75f65729a8b5f38439876ea9c1a"), ("language", "en-US"), ("page", "1"))
            case .nowPlayingMovies: return URL.Route(at: "3", "movie", "now_playing").query(("api_key", "05f4a75f65729a8b5f38439876ea9c1a"), ("language", "en-US"), ("page", "1"))
            case .topRatedMovies: return URL.Route(at: "3", "movie", "top_rated").query(("api_key", "05f4a75f65729a8b5f38439876ea9c1a"), ("language", "en-US"), ("page", "1"))
            case .popularTvShows: return URL.Route(at: "3", "tv", "popular").query(("api_key", "05f4a75f65729a8b5f38439876ea9c1a"), ("language", "en-US"), ("page", "1"))
            case .topRatedTvShows: return URL.Route(at: "3", "tv", "top_rated").query(("api_key", "05f4a75f65729a8b5f38439876ea9c1a"), ("language", "en-US"), ("page", "1"))
                
            case let .movieDetails(for: id): return URL.Route(at: "3", "movie", "\(id)", "credits").query(("api_key", "05f4a75f65729a8b5f38439876ea9c1a"), ("language", "en-US"))
            case let .tvShowDetails(for: id): return URL.Route(at: "3", "tv", "\(id)","credits").query(("api_key", "05f4a75f65729a8b5f38439876ea9c1a"), ("language", "en-US"))
                
        }
    }
    }
    
    static let current: Environment = .production
}
