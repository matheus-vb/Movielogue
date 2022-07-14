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
        else if collectionView == upcomingCollectionView { return upcomingMovies.count }
        else { return 0 }
    }
    
    fileprivate func makePopularCell(_ indexPath: IndexPath) -> popularCollectionViewCell {
        if let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: popularCollectionViewCell.cellIdentifier, for: indexPath) as? popularCollectionViewCell {
            cell.titleLabel.text = popularMovies[indexPath.item].title
            cell.imageView.image = UIImage(named: popularMovies[indexPath.item].backdrop)
            return cell
        }
        return popularCollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) -> nowplayingCollectionViewCell {
        if let cell = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: nowplayingCollectionViewCell.cellIdentifier, for: indexPath) as? nowplayingCollectionViewCell {
            cell.titleLabel.text = nowPlayingMovies[indexPath.item].title
            cell.dateLabel.text = String(nowPlayingMovies[indexPath.item].releaseDate.prefix(4))
            cell.imageView.image = UIImage(named: nowPlayingMovies[indexPath.item].poster)
            return cell
        }
        return nowplayingCollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == popularCollectionView {
            return makePopularCell(indexPath)
        }
        
        else if collectionView == nowPlayingCollectionView {
            return makeNowPlayingCell(indexPath)
        }
        
        else if collectionView == upcomingCollectionView {
            if let cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: "upcomingCell", for: indexPath) as? upcomingCollectionViewCell {
                cell.image.image = UIImage(named: upcomingMovies[indexPath.item].poster)
                cell.name.text = upcomingMovies[indexPath.item].title
                cell.date.text = upcomingMovies[indexPath.item].getUpcomingDate()
                return cell
            }
        }
        
        
        return UICollectionViewCell()
    }
}
