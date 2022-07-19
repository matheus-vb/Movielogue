//
//  trendingViewController.swift
//  projeto_filme
//
//  Created by matheusvb on 18/07/22.
//

import UIKit

class TrendingViewController: UIViewController {

    @IBOutlet var trendingCollectionView: UITableView!
   
    var state: Int = 0
    
    var trendingDayMovies: [Movie] = []
    var trendingWeekMovies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trendingCollectionView.delegate = self
        trendingCollectionView.dataSource = self
        
        Task {
            self.trendingDayMovies = await Movie.trendingDayMoviesAPI()
            self.trendingWeekMovies = await Movie.trendingWeekMoviesAPI()
            self.trendingCollectionView.reloadData()
        }
    }
    
    
    @IBAction func control(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            state = 0
            print(trendingDayMovies.count)
        }
        else if sender.selectedSegmentIndex == 1 {
            state = 1
            print(trendingWeekMovies.count)
        }
        trendingCollectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController {
            let movie = sender as? Movie
            destination.movie = movie
        }
    }
}
