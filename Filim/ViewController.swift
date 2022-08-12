//
//  ViewController.swift
//  Filim
//
//  Created by Akif on 11.08.2022.
//

import UIKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let popularMoviesURL  = "https://api.themoviedb.org/3/movie/popular?api_key=05f4a75f65729a8b5f38439876ea9c1a&language=en-US&page=1"
        
        let popularTvShowsURL  = "https://api.themoviedb.org/3/tv/popular?api_key=05f4a75f65729a8b5f38439876ea9c1a&language=en-US&page=1"
        getDatas(from: popularMoviesURL, from: popularTvShowsURL)
    }
    
    private func getDatas(from popularMoviesUrl: String, from popularTvShowsUrl: String){
        let getPopularMovies = URLSession.shared.dataTask(with: URL(string: popularMoviesUrl)!, completionHandler: {data, response, error in
            guard let popularMoviesData = data, error == nil else {
                return
            }
            var popularMoviesResult: PopularMovies?
            do{
                popularMoviesResult = try JSONDecoder().decode(PopularMovies.self, from: popularMoviesData)
            }catch{
                print(error)
            }
            guard let popularMoviesJson = popularMoviesResult else{
                return
            }
            print(popularMoviesJson.total_results)
            
        })
        getPopularMovies.resume()
        
        
        let getPopularTvShows = URLSession.shared.dataTask(with: URL(string: popularTvShowsUrl)!, completionHandler: {data, response, error in
            guard let tvShowsData = data, error == nil else {
                return
            }
            var popularTvShowsResult: PopularTvShows?
            do{
                popularTvShowsResult = try JSONDecoder().decode(PopularTvShows.self, from: tvShowsData)
            }catch{
                print(error)
            }
            guard let popularTvShowsJson = popularTvShowsResult else{
                return
            }
            print(popularTvShowsJson.total_results)
            
        })
        getPopularTvShows.resume()
    }
 
}
