//
//  nowplayingCollectionViewCell.swift
//  projeto_filme
//
//  Created by matheusvb on 11/07/22.
//

import UIKit

class nowplayingCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "nowPlayingCell"
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    func setup(title: String, date: String, image: UIImage) {
        titleLabel.text = title
        dateLabel.text = date
        self.imageView.image = image
    }
}
