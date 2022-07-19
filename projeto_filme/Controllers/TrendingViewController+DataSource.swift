//
//  TrendingViewController+DataSource.swift
//  projeto_filme
//
//  Created by matheusvb on 18/07/22.
//

import UIKit

extension TrendingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if state == 0 {
            return trendingDayMovies.count
        }
        else if state == 1 {
            return trendingWeekMovies.count
        }
        else {
            return 0
        }
        //return trendingDayMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if state == 0 {
            let cell = trendingCollectionView.dequeueReusableCell(withIdentifier: "trendingCell", for: indexPath) as! trendingTableViewCell
            
            let movie = trendingDayMovies[indexPath.item]
            
            cell.setup(title: movie.title, date: movie.releaseDate ?? "", image: UIImage())
            
            Task {
                let imageData = await Movie.donwloadImageData(withPath: movie.posterPath ?? "")
                let image = UIImage(data: imageData) ?? UIImage()
                cell.setup(title: movie.title, date: movie.releaseDate ?? "", image: image)
            }
            return cell
        }
        
        else if state == 1 {
            let cell = trendingCollectionView.dequeueReusableCell(withIdentifier: "trendingCell", for: indexPath) as! trendingTableViewCell
            
            let movie = trendingWeekMovies[indexPath.item]
            
            cell.setup(title: movie.title, date: movie.releaseDate ?? "", image: UIImage())
            
            Task {
                let imageData = await Movie.donwloadImageData(withPath: movie.posterPath ?? "")
                let image = UIImage(data: imageData) ?? UIImage()
                cell.setup(title: movie.title, date: movie.releaseDate ?? "", image: image)
            }
            return cell
        }
        else {
            return UITableViewCell()
        }
        
        
    }
}
