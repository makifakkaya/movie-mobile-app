//
//  TableViewCell.swift
//  Filim
//
//  Created by Akif on 18.08.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseCateLabel: UILabel!
    @IBOutlet weak var voteAverageLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var originalLanguageLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func prepareMovie(movie: Movie) {
        titleLabel.text = "\(movie.title)"
        releaseCateLabel.text = "📅 \(movie.release_date)"
        voteAverageLabel.text = "⭐ \(movie.vote_average) / 10"
        popularityLabel.text = "👥 \(movie.popularity)"
        let posterImageUrl = "https://image.tmdb.org/t/p/w500"+movie.poster_path!
        posterImage.load(urlString: posterImageUrl)
        originalLanguageLabel.text = "\(flag(country: movie.original_language.uppercased() == "EN" ? "US" : movie.original_language.uppercased() ))"
    }
    
    
    func prepareTvShow(tvShow: TvShow) {
        titleLabel.text = "\(tvShow.name)"
        releaseCateLabel.text = "📅 \(tvShow.first_air_date)"
        voteAverageLabel.text = "⭐ \(tvShow.vote_average) / 10"
        popularityLabel.text = "👥 \(tvShow.popularity)"
        let posterImageUrl = "https://image.tmdb.org/t/p/w500"+tvShow.poster_path!
        posterImage.load(urlString: posterImageUrl)
        originalLanguageLabel.text = "\(flag(country: tvShow.origin_country[0].uppercased() == "EN" ? "US" : tvShow.origin_country[0].uppercased() ))"
    }
    
    func flag(country:String) -> String {
        let base : UInt32 = 127397
        var s = ""
        for v in country.unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return String(s)
    }
    
    
}
