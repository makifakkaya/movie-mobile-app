//
//  NetworkingClient.swift
//  Filim
//
//  Created by Akif on 17.08.2022.
//

import Foundation
import Alamofire

class NetworkingClient{
    func request<T: Decodable>(url: String, completionHandler: @escaping (T) -> Void)  {
        let decoder: JSONDecoder = {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            return decoder
        }()
        AF.request(url).validate(statusCode: 200..<300).responseDecodable(of: T.self, decoder: decoder) { response in
            switch response.result{
            case .success(let items):
                completionHandler(items)
            case .failure(let error):
                print(error)
            }
        }
    }
}


class API{
    static func getPopularMovies(completionHandler: @escaping (MyMovies) -> Void){
        NetworkingClient().request(url: "https://api.themoviedb.org/3/movie/popular?api_key=05f4a75f65729a8b5f38439876ea9c1a&language=en-US&page=1", completionHandler: completionHandler)
    }
    static func getTopRatedMovies(completionHandler: @escaping (MyMovies) -> Void){
        NetworkingClient().request(url: "https://api.themoviedb.org/3/movie/top_rated?api_key=05f4a75f65729a8b5f38439876ea9c1a&language=en-US&page=1", completionHandler: completionHandler)
    }
    static func getNowPlayingMovies(completionHandler: @escaping (MyMovies) -> Void){
        NetworkingClient().request(url: "https://api.themoviedb.org/3/movie/now_playing?api_key=05f4a75f65729a8b5f38439876ea9c1a&language=en-US&page=1", completionHandler: completionHandler)
    }
    static func getPopularTvShows(completionHandler: @escaping (MyTvShows) -> Void){
        NetworkingClient().request(url: "https://api.themoviedb.org/3/tv/popular?api_key=05f4a75f65729a8b5f38439876ea9c1a&language=en-US&page=1", completionHandler: completionHandler)
    }
    static func getTopRatedTvShows(completionHandler: @escaping (MyTvShows) -> Void){
        NetworkingClient().request(url: "https://api.themoviedb.org/3/tv/top_rated?api_key=05f4a75f65729a8b5f38439876ea9c1a&language=en-US&page=1", completionHandler: completionHandler)
    }
    static func getMovieDetails(id: Int, completionHandler: @escaping (MovieCredits) -> Void){
        NetworkingClient().request(url: "https://api.themoviedb.org/3/movie/\(id)/credits?api_key=05f4a75f65729a8b5f38439876ea9c1a&language=en-US", completionHandler: completionHandler)
    }
    static func getTvShowDetails(id: Int, completionHandler: @escaping (TvShowCredits) -> Void){
        NetworkingClient().request(url: "https://api.themoviedb.org/3/tv/\(id)/credits?api_key=05f4a75f65729a8b5f38439876ea9c1a&language=en-US", completionHandler: completionHandler)
    }
}
