//
//  DetailsViewController.swift
//  projeto_filme
//
//  Created by matheusvb on 13/07/22.
//

import UIKit

class DetailsViewController: UIViewController {

    var movie: Movie?
    
    @IBOutlet var backdropImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let movie = movie else {
            return
        }

        self.title = movie.title
        
        Task {
            let imageData = await Movie.donwloadImageData(withPath: movie.backdropPath ?? "")
            let image = UIImage(data: imageData) ?? UIImage()
            backdropImage.image = UIImage(data: imageData)
            let posterData = await Movie.donwloadImageData(withPath: movie.posterPath ?? "")
            let poster = UIImage(data: posterData) ?? UIImage()
            posterImage.image = UIImage(data: posterData) ?? UIImage()
        }

        let rating = String(format: "%.1f", movie.voteAverage)
        
        titleLabel.text = movie.title
        posterImage.image = UIImage(named: movie.posterPath ?? "")
        ratingLabel.text = "Rating: \(rating)/10"
        overviewLabel.text = movie.overview
    }
}
