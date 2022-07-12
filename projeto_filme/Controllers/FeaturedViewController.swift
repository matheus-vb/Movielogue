//
//  ViewController.swift
//  projeto_filme
//
//  Created by matheusvb on 05/07/22.
//

import UIKit

class FeaturedViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "popularCell", for: indexPath) as? popularCollectionViewCell {
            cell.titleLabel.text = "Titulo filme"
            cell.image.image = UIImage()
            return cell
        }
        
    
        return UICollectionViewCell()
    }
    

    @IBOutlet var upcomingCollectionView: UICollectionView!
    @IBOutlet var nowPlayingCollectionView: UICollectionView!
    @IBOutlet var popularCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        popularCollectionView.dataSource = self
        popularCollectionView.delegate = self
    }

    

}

