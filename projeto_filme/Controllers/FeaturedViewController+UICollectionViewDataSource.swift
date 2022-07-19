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
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == popularCollectionView {
            return makePopularCell(indexPath)
        }
        
        else if collectionView == nowPlayingCollectionView {
            return makeNowPlayingCell(indexPath)
        }
        
        else if collectionView == upcomingCollectionView {
            return makeUpcomingCell(indexPath)
        }
        
        
        return UICollectionViewCell()
    }

    fileprivate func makePopularCell(_ indexPath: IndexPath) -> popularCollectionViewCell {
        if let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: popularCollectionViewCell.cellIdentifier, for: indexPath) as? popularCollectionViewCell {
            
            cell.setup(title: popularMovies[indexPath.item].title, image: UIImage())
            
            let movie = popularMovies[indexPath.item]
            
            Task {
                let imageData = await Movie.donwloadImageData(withPath: movie.backdropPath ?? "")
                let image = UIImage(data: imageData) ?? UIImage()
                cell.setup(title: movie.title, image: image)
            }
            
            return cell
        }
        return popularCollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) -> nowplayingCollectionViewCell {
        if let cell = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: nowplayingCollectionViewCell.cellIdentifier, for: indexPath) as? nowplayingCollectionViewCell {
            
            cell.setup(title: nowPlayingMovies[indexPath.item].title, date: nowPlayingMovies[indexPath.item].releaseDate ?? "", image: UIImage())
            
            let movie = nowPlayingMovies[indexPath.item]
            
            Task {
                let imageData = await Movie.donwloadImageData(withPath: movie.posterPath ?? "")
                let image = UIImage(data: imageData) ?? UIImage()
                cell.setup(title: movie.title, date: String("\(nowPlayingMovies[indexPath.item].releaseDate)".prefix(4)), image: image)
            }
            
            return cell
        }
        return nowplayingCollectionViewCell()
    }
    
    fileprivate func makeUpcomingCell(_ indexPath: IndexPath) -> upcomingCollectionViewCell {
        if let cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: upcomingCollectionViewCell.cellIdentifier, for: indexPath) as? upcomingCollectionViewCell {
            
            cell.setup(title: upcomingMovies[indexPath.item].title, release: upcomingMovies[indexPath.item].releaseDate ?? "", image: UIImage())
            
            let movie = upcomingMovies[indexPath.item]
            
            Task {
                let imageData = await Movie.donwloadImageData(withPath: movie.posterPath ?? "")
                let image = UIImage(data: imageData) ?? UIImage()
                cell.setup(title: movie.title, release: upcomingMovies[indexPath.item].getUpcomingDate(), image: image)
            }
            
            return cell
        }
        return upcomingCollectionViewCell()
    }
    
}
