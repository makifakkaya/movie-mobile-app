//
//  TvShowTableViewCell.swift
//  Filim
//
//  Created by Akif on 12.08.2022.
//

import UIKit

class TvShowTableViewCell: UITableViewCell {
    
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

    
    func prepareTvShow(tvShow: TvShow) {
        titleLabel.text = "\(tvShow.name)"
        releaseCateLabel.text = "📅 \(tvShow.first_air_date)"
        voteAverageLabel.text = "⭐ \(tvShow.vote_average) / 10"
        popularityLabel.text = "👥 \(tvShow.popularity)"
        let posterImageUrl = "https://image.tmdb.org/t/p/w500"+tvShow.poster_path!
        posterImage.load(urlString: posterImageUrl)
        if(tvShow.origin_country.count != 0) {
            originalLanguageLabel.text = "\(flag(country: tvShow.origin_country[0].uppercased() ))"
        } else {
            originalLanguageLabel.text = "\(tvShow.original_language.uppercased())"
        }
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
