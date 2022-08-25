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
    
    var tvShowCast: [TvShowCast] = []
    var tvShowCredits: TvShowCredits?
    var tvShow: TvShow!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        placeTvShowDetail()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tvShowCast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cvcell", for: indexPath) as! CastCollectionViewCell
        cell.prepareTvShowCast(tvCast: tvShowCast[indexPath.row])
        return cell
    }
    
    func placeTvShowDetail(){
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
    }
}
