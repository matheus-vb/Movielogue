//
//  searchViewController.swift
//  projeto_filme
//
//  Created by matheusvb on 19/07/22.
//

import UIKit

class searchViewController: UIViewController, UISearchResultsUpdating {
    
    
    @IBOutlet var searchTableView: UITableView!
    
    var searchMovies: [Movie] = []
    var genres: [Genre] = []
    
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTableView.dataSource = self
        searchTableView.delegate = self
        
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Movie title"
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let title = searchController.searchBar.text else {
            return
        }
        
        Task {
            self.searchMovies = await Movie.searchMoviesAPI(title: title)
            print(searchMovies.count)
            searchTableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController {
            let movie = sender as? Movie
            destination.movie = movie
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
