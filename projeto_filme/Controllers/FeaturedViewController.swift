//
//  ViewController.swift
//  projeto_filme
//
//  Created by matheusvb on 05/07/22.
//

import UIKit

class FeaturedViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var upcomingCollectionView: UICollectionView!
    @IBOutlet var nowPlayingCollectionView: UICollectionView!
    @IBOutlet var popularCollectionView: UICollectionView!
    
    let popularMovies  = Movie.popularMovies()
    let nowPlayingMovies = Movie.nowPlayingMovies()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        popularCollectionView.dataSource = self
        popularCollectionView.delegate = self
        nowPlayingCollectionView.dataSource = self
        nowPlayingCollectionView.delegate = self
        
        
        
        
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == popularCollectionView { return popularMovies.count }
        else if collectionView == nowPlayingCollectionView { return nowPlayingMovies.count }
        //else if.... upcoming view
        else { return 0 }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == popularCollectionView {
            if let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: "popularCell", for: indexPath) as? popularCollectionViewCell {
                cell.titleLabel.text = popularMovies[indexPath.item].title
                cell.imageView.image = UIImage(named: popularMovies[indexPath.item].backdrop)
                return cell
            }
        }
        
        else if collectionView == nowPlayingCollectionView {
            if let cell = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: "nowPlayingCell", for: indexPath) as? nowplayingCollectionViewCell {
                cell.titleLabel.text = nowPlayingMovies[indexPath.item].title
                cell.dateLabel.text = nowPlayingMovies[indexPath.item].releaseDate
                cell.imageView.image = UIImage(named: nowPlayingMovies[indexPath.item].poster)
                return cell
            }
        }
        
        
        return UICollectionViewCell()
    }
    

}

