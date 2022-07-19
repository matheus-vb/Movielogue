//
//  trendingTableViewCell.swift
//  projeto_filme
//
//  Created by matheusvb on 18/07/22.
//

import UIKit

class trendingTableViewCell: UITableViewCell {
    static let cellIdentifier = "trendingCell"
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var imagePosterView: UIImageView!
    
    func setup(title: String, date: String, image: UIImage) {
        titleLabel.text = title
        dateLabel.text = date
        self.imagePosterView.image = image
    }
    
    
}
