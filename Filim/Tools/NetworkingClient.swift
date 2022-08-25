//
//  NetworkingClient.swift
//  Filim
//
//  Created by Akif on 17.08.2022.
//

import Foundation
import Alamofire
import SweetRouter

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
        print("\(Router<Api>(at: .popularMovies).url)")
        NetworkingClient().request(url: "\(Router<Api>(at: .popularMovies).url)", completionHandler: completionHandler)
    }
    static func getTopRatedMovies(completionHandler: @escaping (MyMovies) -> Void){
        NetworkingClient().request(url: "\(Router<Api>(at: .topRatedMovies).url)", completionHandler: completionHandler)
    }
    static func getNowPlayingMovies(completionHandler: @escaping (MyMovies) -> Void){
        NetworkingClient().request(url: "\(Router<Api>(at: .nowPlayingMovies).url)", completionHandler: completionHandler)
    }
    static func getPopularTvShows(completionHandler: @escaping (MyTvShows) -> Void){
        NetworkingClient().request(url: "\(Router<Api>(at: .popularTvShows).url)", completionHandler: completionHandler)
    }
    static func getTopRatedTvShows(completionHandler: @escaping (MyTvShows) -> Void){
        NetworkingClient().request(url: "\(Router<Api>(at: .topRatedTvShows).url)", completionHandler: completionHandler)
    }
    static func getMovieDetails(id: Int, completionHandler: @escaping (MovieCredits) -> Void){
        NetworkingClient().request(url: "\(Router<Api>(at: .movieDetails(for: id)).url)", completionHandler: completionHandler)
    }
    static func getTvShowDetails(id: Int, completionHandler: @escaping (TvShowCredits) -> Void){
        NetworkingClient().request(url: "\(Router<Api>(at: .tvShowDetails(for: id)).url)", completionHandler: completionHandler)
    }
}
