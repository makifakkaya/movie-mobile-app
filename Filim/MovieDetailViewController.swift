//
//  DetailViewController.swift
//  Filim
//
//  Created by Akif on 11.08.2022.
//

import UIKit

class MovieDetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var moviePopularity: UILabel!
    @IBOutlet weak var movieDuration: UILabel!
    @IBOutlet weak var movieSummary: UILabel!
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let posterImageUrl = "https://image.tmdb.org/t/p/w500"+movie.backdrop_path!
        movieImage.load(urlString: posterImageUrl)
        movieTitle.text = movie.title
        movieRating.text = "\(movie.vote_average) / 10"
        moviePopularity.text = "\(movie.popularity)"
        movieDuration.text = movie.original_language
        movieSummary.text = movie.overview
        loadData(movieID: movie.id)
    }
    
    var Results: [MovieCast] = []
    var Result: MovieCredits?
    
    private func loadData(movieID: Int){
        
            guard let jsonUrl = URL(string: "https://api.themoviedb.org/3/movie/\(movieID)/credits?api_key=05f4a75f65729a8b5f38439876ea9c1a&language=en-US"), let data = try? Data(contentsOf: jsonUrl) else {
                 return
            }
            do {
                Result = try JSONDecoder().decode(MovieCredits.self, from: data)
                Results = Result!.cast
            } catch  {
                print(error.localizedDescription)
            }
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return Results.count >= 10 ? 10 : Results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cvcell", for: indexPath) as! CastCollectionViewCell
        
        
        //cell.castImage.image = UIImage(named: castImages[indexPath.row])
        cell.castLabel1.text = Results[indexPath.row].character
        cell.castLabel2.text = Results[indexPath.row].original_name
        let profileImageUrl = "https://image.tmdb.org/t/p/w500"+Results[indexPath.row].profile_path!
        cell.castImage.load(urlString: profileImageUrl)
        
        return cell
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
