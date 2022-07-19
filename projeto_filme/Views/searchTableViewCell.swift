//
//  TableViewCell.swift
//  projeto_filme
//
//  Created by matheusvb on 19/07/22.
//

import UIKit

class searchTableViewCell: UITableViewCell {

    @IBOutlet var imagePosterView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    func setup(title: String, date: String, image: UIImage) {
        titleLabel.text = title
        dateLabel.text = date
        self.imagePosterView.image = image
    }
    
}
