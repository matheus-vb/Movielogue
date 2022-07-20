//
//  ViewController.swift
//  projeto_filme
//
//  Created by matheusvb on 05/07/22.
//

import UIKit

class FeaturedViewController: UIViewController {
    
    @IBOutlet var upcomingCollectionView: UICollectionView!
    @IBOutlet var nowPlayingCollectionView: UICollectionView!
    @IBOutlet var popularCollectionView: UICollectionView!
    

    
    var popularMovies: [Movie] = []
    var nowPlayingMovies: [Movie] = []
    var upcomingMovies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popularCollectionView.dataSource = self
        popularCollectionView.delegate = self
        nowPlayingCollectionView.dataSource = self
        nowPlayingCollectionView.delegate = self
        upcomingCollectionView.dataSource = self
        upcomingCollectionView.delegate = self
        
        Task {
            self.popularMovies = await Movie.popularMoviesAPI()
            self.popularCollectionView.reloadData()
            self.nowPlayingMovies = await Movie.nowPlayingMoviesAPI()
            self.nowPlayingCollectionView.reloadData()
            self.upcomingMovies = await Movie.upcomingMoviesAPI()
            self.upcomingCollectionView.reloadData()
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsSegue" {
            if let destination = segue.destination as? DetailsViewController {
                let movie = sender as? Movie
                destination.movie = movie
            }
        }
        else if segue.identifier == "popularSeeAll" {
            if let destination = segue.destination as? SeeAllViewController {
                destination.seeAllMovies = popularMovies
            }
        }
        else if segue.identifier == "nowPlayingSeeAll" {
            if let destination = segue.destination as? SeeAllViewController {
                destination.seeAllMovies = nowPlayingMovies
            }
        }
        else if segue.identifier == "upcomingSeeAll" {
            if let destination = segue.destination as? SeeAllViewController {
                destination.seeAllMovies = upcomingMovies
            }
        }
        
        
        
        
    }
    
    
    
    
}

