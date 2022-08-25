//
//  DetailViewController.swift
//  Filim
//
//  Created by Akif on 11.08.2022.
//

import UIKit
import Alamofire
import SwiftyJSON

class MovieDetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var movieCast: [MovieCast] = []
    var movieCredits: MovieCredits?
    var movie: Movie!
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var moviePopularity: UILabel!
    @IBOutlet weak var movieLanguage: UILabel!
    @IBOutlet weak var movieSummary: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        placeMovieDetail()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieCast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cvcell", for: indexPath) as! CastCollectionViewCell
        
        cell.prepareMovieCast(movieCast: movieCast[indexPath.row])
        return cell
    }
    
    
    func placeMovieDetail(){
        if(movie.backdrop_path != nil) {
            let posterImageUrl = "https://image.tmdb.org/t/p/w500"+movie.backdrop_path!
            movieImage.load(urlString: posterImageUrl)
        } else {
            let posterImageUrl = "https://image.tmdb.org/t/p/w500"+movie.poster_path!
            movieImage.load(urlString: posterImageUrl)
        }
        movieTitle.text = movie.title
        movieRating.text = "\(movie.vote_average) / 10"
        moviePopularity.text = "\(movie.popularity)"
        movieLanguage.text = movie.original_language
        movieSummary.text = movie.overview
    }
}
