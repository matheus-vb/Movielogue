//
//  TrendingViewController+Delegate.swift
//  projeto_filme
//
//  Created by matheusvb on 18/07/22.
//

import UIKit

extension TrendingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if state == 0 {
            let movie = trendingDayMovies[indexPath.item]
            performSegue(withIdentifier: "detailsSegue", sender: movie)
        }
        else if state == 1 {
            let movie = trendingWeekMovies[indexPath.item]
            performSegue(withIdentifier: "detailsSegue", sender: movie)
        }
    }
}
