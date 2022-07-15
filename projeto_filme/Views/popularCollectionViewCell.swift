//
//  popularCollectionViewCell.swift
//  projeto_filme
//
//  Created by matheusvb on 11/07/22.
//

import UIKit

class popularCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "popularCell"
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    func setup(title: String, image: UIImage) {
        titleLabel.text = title
        self.imageView.image = image
    }
}
