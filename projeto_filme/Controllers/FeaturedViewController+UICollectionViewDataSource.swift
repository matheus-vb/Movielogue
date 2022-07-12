//
//  FeaturedViewController+UICollectionViewDataSource.swift
//  projeto_filme
//
//  Created by matheusvb on 12/07/22.
//

import UIKit

extension FeaturedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == popularCollectionView { return popularMovies.count }
        else if collectionView == nowPlayingCollectionView { return nowPlayingMovies.count }
        //else if.... upcoming view
        else { return 0 }
    }
    
    fileprivate func makePopularCell(_ indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: "popularCell", for: indexPath) as? popularCollectionViewCell {
            cell.titleLabel.text = popularMovies[indexPath.item].title
            cell.imageView.image = UIImage(named: popularMovies[indexPath.item].backdrop)
            return cell
        }
        return UICollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: "nowPlayingCell", for: indexPath) as? nowplayingCollectionViewCell {
            cell.titleLabel.text = nowPlayingMovies[indexPath.item].title
            cell.dateLabel.text = nowPlayingMovies[indexPath.item].releaseDate
            cell.imageView.image = UIImage(named: nowPlayingMovies[indexPath.item].poster)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == popularCollectionView {
            return makePopularCell(indexPath)
        }
        
        
        else if collectionView == nowPlayingCollectionView {
            return makeNowPlayingCell(indexPath)
        }
        
        
        return UICollectionViewCell()
    }
}
