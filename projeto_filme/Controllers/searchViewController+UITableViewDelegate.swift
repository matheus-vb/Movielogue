//
//  searchViewController+UITableViewDelegate.swift
//  projeto_filme
//
//  Created by matheusvb on 19/07/22.
//

import UIKit

extension searchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = searchMovies[indexPath.item]
        
        performSegue(withIdentifier: "detailsSegue", sender: movie)
    }
}
