//
//  DetailsViewController.swift
//  projeto_filme
//
//  Created by matheusvb on 13/07/22.
//

import UIKit

class DetailsViewController: UIViewController {

    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = movie?.title
    }
}
