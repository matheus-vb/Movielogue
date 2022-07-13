//
//  FeaturedViewController+Delegate.swift
//  projeto_filme
//
//  Created by matheusvb on 13/07/22.
//

import UIKit

extension FeaturedViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie: Movie
        
        if collectionView == self.popularCollectionView {
            //self.performSegue(withIdentifier: "detailsSegue", sender: movie)
            movie = popularMovies[indexPath.item]
        }
        else {
            movie = nowPlayingMovies[indexPath.item]
        }
        //else if.....
        self.performSegue(withIdentifier: "detailsSegue", sender: movie)
    }
}
