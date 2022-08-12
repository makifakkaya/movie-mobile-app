//
//  TvShowDetailViewController.swift
//  Filim
//
//  Created by Akif on 12.08.2022.
//

import UIKit

class TvShowDetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var tvShowImage: UIImageView!
    @IBOutlet weak var tvShowTitle: UILabel!
    @IBOutlet weak var tvShowRating: UILabel!
    @IBOutlet weak var tvShowPopularity: UILabel!
    @IBOutlet weak var tvShowLanguage: UILabel!
    @IBOutlet weak var tvShowSummary: UILabel!
    
    
    var tvShow: TvShow!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(tvShow.backdrop_path != nil) {
            
            let posterImageUrl = "https://image.tmdb.org/t/p/w500"+tvShow.backdrop_path!
            tvShowImage.load(urlString: posterImageUrl)
        } else {
            
            let posterImageUrl = "https://image.tmdb.org/t/p/w500"+tvShow.poster_path!
            tvShowImage.load(urlString: posterImageUrl)
        }
        
        tvShowTitle.text = tvShow.name
        tvShowRating.text = "\(tvShow.vote_average) / 10"
        tvShowPopularity.text = "\(tvShow.popularity)"
        tvShowLanguage.text = tvShow.original_language
        tvShowSummary.text = tvShow.overview
        loadData(tvShowID: tvShow.id)
    }
    
    var Results: [TvShowCast] = []
    var Result: TvShowCredits?
    
    private func loadData(tvShowID: Int){
        
            guard let jsonUrl = URL(string: "https://api.themoviedb.org/3/tv/\(tvShowID)/credits?api_key=05f4a75f65729a8b5f38439876ea9c1a&language=en-US"), let data = try? Data(contentsOf: jsonUrl) else {
                 return
            }
            do {
                Result = try JSONDecoder().decode(TvShowCredits.self, from: data)
                Results = Result!.cast
            } catch  {
                print(error.localizedDescription)
            }
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Results.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cvcell", for: indexPath) as! CastCollectionViewCell
        
        
        //cell.castImage.image = UIImage(named: castImages[indexPath.row])
        cell.castLabel1.text = Results[indexPath.row].character
        cell.castLabel2.text = Results[indexPath.row].original_name
        
        if(Results[indexPath.row].profile_path != nil) {
            
            let profileImageUrl = "https://image.tmdb.org/t/p/w500"+Results[indexPath.row].profile_path!
            cell.castImage.load(urlString: profileImageUrl)
            
        }
        
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
