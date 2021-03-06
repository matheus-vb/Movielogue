//
//  searchViewControler+UITableViewDataSource.swift
//  projeto_filme
//
//  Created by matheusvb on 19/07/22.
//

import UIKit

extension searchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchMovies.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchTableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as? searchTableViewCell
        
        let movie = searchMovies[indexPath.item]
        
        cell?.setup(title: movie.title, date: String(movie.releaseDate?.prefix(4) ?? ""), image: UIImage())
        
        Task {
            let imageData = await Movie.donwloadImageData(withPath: movie.posterPath ?? "")
            let image = UIImage(data: imageData) ?? UIImage()
            cell?.setup(title: movie.title, date: String(movie.releaseDate?.prefix(4) ?? ""), image: image)
        }
        
        return cell!
    }
    
    
}
