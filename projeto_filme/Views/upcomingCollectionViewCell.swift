//
//  upcomingCollectionViewCell.swift
//  projeto_filme
//
//  Created by matheusvb on 11/07/22.
//

import UIKit

class upcomingCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "upcomingCell"
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var date: UILabel!
 
    func setup(title: String, release: String, image: UIImage) {
        name.text = title
        date.text = release
        self.imageView.image = image
    }
    
}
