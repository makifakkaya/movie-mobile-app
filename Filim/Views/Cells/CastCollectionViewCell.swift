//
//  CastCollectionViewCell.swift
//  Filim
//
//  Created by Akif on 12.08.2022.
//

import UIKit

class CastCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var originalNameLabel: UILabel!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var castImage: UIImageView!
    
    
    func prepareMovieCast(movieCast: MovieCast) {
        characterNameLabel.text = movieCast.character
        originalNameLabel.text = movieCast.original_name
        if(movieCast.profile_path != nil) {
        let profileImageUrl = "https://image.tmdb.org/t/p/w500"+movieCast.profile_path!
        castImage.load(urlString: profileImageUrl)
        }
    }
    
    func prepareTvShowCast(tvCast: TvShowCast) {
        characterNameLabel.text = tvCast.character
        originalNameLabel.text = tvCast.original_name
        if(tvCast.profile_path != nil) {
            let profileImageUrl = "https://image.tmdb.org/t/p/w500"+tvCast.profile_path!
            castImage.load(urlString: profileImageUrl)
        }
    }
}
