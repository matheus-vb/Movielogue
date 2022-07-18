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
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if state == 0 {
            if let cell = trendingCollectionView.dequeueReusableCell(withIdentifier: trendingTableViewCell.cellIdentifier, for: indexPath) as? trendingTableViewCell {
                
                cell.setup(title: trendingDayMovies[indexPath.item].title, date: trendingDayMovies[indexPath.item].releaseDate, image: UIImage())
                
                let movie = trendingDayMovies[indexPath.item]
                
                Task {
                    let imageData = await Movie.donwloadImageData(withPath: movie.posterPath)
                    let image = UIImage(data: imageData) ?? UIImage()
                    cell.setup(title: movie.title, date: trendingDayMovies[indexPath.item].releaseDate, image: image)
                }
                
                return cell
            }
        }
        
        
        return UITableViewCell()
    }
    


}
