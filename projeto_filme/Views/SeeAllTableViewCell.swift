//
//  seeAllTableViewCell.swift
//  projeto_filme
//
//  Created by matheusvb on 19/07/22.
//

import UIKit

class SeeAllTableViewCell: UITableViewCell {

    @IBOutlet var imageViewPoster: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    

    func setup(title: String, date: String, image: UIImage) {
        titleLabel.text = title
        dateLabel.text = date
        self.imageViewPoster.image = image
    }
    
}
