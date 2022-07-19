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
        let cell = sea
        
        
        
        return UITableViewCell()
    }
    
    
}
