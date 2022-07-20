//
//  seeAllTableViewCell.swift
//  projeto_filme
//
//  Created by matheusvb on 19/07/22.
//

import UIKit

class SeeAllTableViewCell: UITableViewCell {

    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var imageViewPoster: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    

    func setup(title: String, date: String, rating: Float, image: UIImage) {
        titleLabel.text = title
        dateLabel.text = date
        ratingLabel.text = "\(rating)"
        self.imageViewPoster.image = image
    }
    
}
